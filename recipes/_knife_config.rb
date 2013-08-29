jenkins_home  = node['jenkins']['server']['home']
jenkins_user  = node['jenkins']['server']['user']
jenkins_group = node['jenkins']['server']['group']

directory "#{jenkins_home}/.chef" do
  owner jenkins_user
  group jenkins_group
  mode  0700
end

file "#{jenkins_home}/.chef/jenkins.pem" do
  content node['se-jenkins']['chef']['client_key']

  owner jenkins_user
  group jenkins_group
  mode  0600
end

template "#{jenkins_home}/.chef/knife.rb" do
  source "knife.rb.erb"

  owner jenkins_user
  group jenkins_group
  mode  0600
end
