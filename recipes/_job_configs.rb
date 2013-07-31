job_config = data_bag_item("jenkins", "jobs")

job_config['jobs'].each do |project, config|
  job = node['se-jenkins']['default_job_config'].merge(config)

  job['include_recipes'].each do |recipe|
    include_recipe recipe
  end

  job['name']    ||= project.split('/').last
  job['project']   = project
  
  job_config = File.join(node['jenkins']['server']['home'], "#{job['name']}_config.xml")

  jenkins_job job['name'] do
    action :nothing
    config job_config
  end

  template job_config do
    source "job_config.xml.erb"
    variables({ job: job })
    notifies :update, "jenkins_job[#{job['name']}]", :immediately
    notifies :build,  "jenkins_job[#{job['name']}]", :immediately
  end
end
