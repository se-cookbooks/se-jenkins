bundle_dir = "#{node['jenkins']['server']['home']}/.bundle"

directory bundle_dir do
  owner node['jenkins']['server']['user']
  group node['jenkins']['server']['group']
  mode  0755
end

cookbook_file "#{bundle_dir}/config" do
  source "bundle_config"

  owner node['jenkins']['server']['user']
  group node['jenkins']['server']['group']
  mode  0644
end
