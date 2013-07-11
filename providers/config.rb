action :delete do
  file "#{node['jenkins']['server']['data_dir']}/#{new_resource.name}" do
    action :delete
  end
end

action :create do
  store(new_resource)
end

action :update do
  store(new_resource)
end

def store(new_resource)
  t = template "#{node['jenkins']['server']['data_dir']}/#{new_resource.name}" do
    source "#{new_resource.name}.erb"
    owner node['jenkins']['server']['user']
    group node['jenkins']['server']['group']
    mode 0644
    notifies :restart, "runit_service[jenkins]"
    action :create
  end
  new_resource.updated_by_last_action(t.updated_by_last_action?)
end

#def store
#  template "#{node['jenkins']['server']['data_dir']}/#{@new_resource.filename}" do
#    source "#{@new_resouce.filename}.erb"
#    owner node['jenkins']['server']['user']
#    group node['jenkins']['server']['group']
#    mode 0644
#    notifies :restart, "runit_service[jenkins]"
#  end
#end

#alias_method :action_create, :store
#alias_method :action_update, :store

#def action_delete

#end
