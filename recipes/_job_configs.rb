require 'ostruct'

{
  "StreetEasy/se-cli" => {
    build_command: "script/ci >build.log",
    artifacts: ["build.log"],
    branches: ["master"],
    ruby_versions: ["ree-1.8.7-2012.02", "1.9.3p385"]
  }
}

job = OpenStruct.new
job.github_project = "StreetEasy/se-cli"
job.build_command = "script/ci > build.log"
job.artifacts = "build.log"
job.branches = "master"


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
