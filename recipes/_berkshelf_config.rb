directory "#{node['jenkins']['server']['home']}/.berkshelf" do
  owner node['jenkins']['server']['user']
  group node['jenkins']['server']['group']
  mode  0700
end

cookbook_file "#{node['jenkins']['server']['home']}/.berkshelf/config.json" do
  source "berkshelf-config.json"

  owner node['jenkins']['server']['user']
  group node['jenkins']['server']['group']
  mode  0600
end
