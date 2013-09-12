node.set['jenkins']['server']['version']      = '1.530'

node.set['jenkins']['server']['plugins'] = %w(
  campfire
  git
  git-client
  github
  github-api
  github-oauth
  javadoc
  mailer
  rake
  token-macro
)

# Don't enable GitHub OAuth in development
if File.read("/etc/passwd").match(/vagrant/)
  node.set['se-jenkins']['use_security'] = false
else
  node.set['se-jenkins']['use_security'] = true
  password_file = '/etc/chef/jenkins_cli_token'

  if File.exists?(password_file)
    node.set['jenkins']['cli']['username']      = 'se-system'
    node.set['jenkins']['cli']['password_file'] = password_file
  end
end

if !Chef::Config[:solo] && node.chef_environment == "production"
  include_recipe "se-jenkins::_configure_from_databag"

  node.set['jenkins']['server']['host'] = 'ci.s--e.net'
  node.set['jenkins']['server']['url'] = "http://#{node['jenkins']['server']['host']}:#{node['jenkins']['server']['port']}/"
end

include_recipe "docker"
include_recipe "git"
include_recipe "jenkins::server"

service "docker" do
  action :nothing
end

group "docker" do
  members node['jenkins']['server']['user']
  notifies :restart, "service[docker]"
end

# Install all the Rubies that we use
include_recipe "se-ruby::ruby18"
include_recipe "se-ruby::ruby19"
include_recipe "se-ruby::ruby20"
include_recipe "se-ruby"

template "#{node['jenkins']['server']['home']}/config.xml" do
  source "config.xml.erb"

  owner "jenkins"
  group "jenkins"
  mode  0644

  notifies :restart, "service[jenkins]"
end

include_recipe "se-jenkins::_aws_credentials"
include_recipe "se-jenkins::_berkshelf_config"
include_recipe "se-jenkins::_knife_config"
include_recipe "se-jenkins::_ssh_keys"
include_recipe "se-jenkins::_bundler_config"
include_recipe "se-jenkins::_plugin_configs"
include_recipe "se-jenkins::_job_configs"
