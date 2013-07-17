ssh_dir = "#{node['jenkins']['server']['home']}/.ssh"

directory ssh_dir do
  owner node['jenkins']['server']['user']
  group node['jenkins']['server']['group']
  mode  0700
end

file "#{ssh_dir}/id_rsa" do
  content node['se-jenkins']['ssh_key']
  owner node['jenkins']['server']['user']
  group node['jenkins']['server']['group']
  mode  0600
end

file "#{ssh_dir}/id_rsa.pub" do
  action :delete
end

execute "SSH to GitHub as jenkins" do
  command "ssh -o StrictHostKeyChecking=no git@github.com 2>&1 | grep -q 'successfully authenticated'"
  user node['jenkins']['server']['user']
  creates "#{node['jenkins']['server']['home']}/.ssh/known_hosts"
end
