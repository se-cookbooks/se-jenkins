template "#{node['jenkins']['server']['home']}/.profile" do
  source "dot_profile.erb"

  owner node['jenkins']['server']['user']
  group node['jenkins']['server']['group']
  mode  0644
end
