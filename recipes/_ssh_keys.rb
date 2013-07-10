ssh_dir = "#{node['jenkins']['server']['home']}/.ssh"

directory ssh_dir do
  owner node['jenkins']['server']['user']
  group node['jenkins']['server']['group']
  mode  0700
end

cookbook_file "#{ssh_dir}/id_rsa" do
  source "id_rsa"
  owner node['jenkins']['server']['user']
  group node['jenkins']['server']['group']
  mode  0600
end
