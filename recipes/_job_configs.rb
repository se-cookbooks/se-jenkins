require 'ostruct'

# TODO: put jobs into a data bag
jobs = {
  "StreetEasy/se-cli" => {
    artifacts:     ["build.log"],
    branches:      ["master"],
    build_command: "script/ci >build.log",
    ruby_versions: ["ree-1.8.7-2012.02", "1.9.3p385"]
  }
}

jobs.each do |job_project, job_data|
  job = OpenStruct.new(job_data.merge(github_project: job_project))

  job_name   = job.github_project.split("/").last
  job_config = File.join(node['jenkins']['server']['home'], "#{job_name}_config.xml")

  jenkins_job job_name do
    action :nothing
    config job_config
  end

  template job_config do
    source "job_config.xml.erb"
    variables({ job: job })
    notifies :update, resources(jenkins_job: job_name), :immediately
    notifies :build,  resources(jenkins_job: job_name), :immediately
  end
end
