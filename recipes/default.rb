node.set['jenkins']['server']['version']      = '1.522'
node.set['jenkins']['server']['war_checksum'] = 'e227c291191b2554267b4b338ea34ef86a9aa42096928e42bebdf6e90cf3e314'

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
end

if !Chef::Config[:solo] && node.chef_environment == "production"
  include_recipe "se-jenkins::_configure_from_databag"

  node.set['jenkins']['server']['host'] = 'ci.s--e.net'
  node.set['jenkins']['server']['url'] = "http://#{node['jenkins']['server']['host']}:#{node['jenkins']['server']['port']}/"
end

include_recipe "git"
include_recipe "jenkins::server"

# Install all the Rubies that we use
include_recipe "se-ruby::ruby18"
include_recipe "se-ruby::ruby19"
include_recipe "se-ruby::ruby20"
include_recipe "se-ruby"


template "#{node['jenkins']['server']['data_dir']}/config.xml" do
  source "config.xml.erb"

  owner "jenkins"
  group "jenkins"
  mode  0644
end

include_recipe "se-jenkins::_aws_credentials"
include_recipe "se-jenkins::_berkshelf_config"
include_recipe "se-jenkins::_knife_config"
include_recipe "se-jenkins::_ssh_keys"
include_recipe "se-jenkins::_bundler_config"
include_recipe "se-jenkins::_plugin_configs"
include_recipe "se-jenkins::_job_configs"
