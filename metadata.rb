name             "se-jenkins"
maintainer       "se-jenkins"
maintainer_email "se-jenkins"
license          "All rights reserved"
description      "Installs/Configures se-jenkins"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.7'

depends "docker"
depends "git"
depends "jenkins"
depends "se-ruby", "= 3.0.4"

depends "percona"
depends "streeteasy_com", "= 0.0.5"

#jobs_data_bag = File.expand_path(File.dirname(__FILE__) + '/data_bags/jenkins/jobs.json')
#job_config = JSON.parse(File.read(jobs_data_bag))

#job_config['jobs'].each do |name, config|
#  if config.has_key?('include_recipes')
#    config['include_recipes'].each do |recipe|
#      cookbook = recipe.split('::').first
#      depends cookbook
#    end
#  end
#end
