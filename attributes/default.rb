# This will be written to ~jenkins/.ssh/id_rsa.
# The matching public key should be uploaded to GitHub.
default['se-jenkins']['ssh_key'] = ""

# Your Campfire account's subdomain
default['se-jenkins']['campfire']['account']   = ""

# Your Campfire API token
default['se-jenkins']['campfire']['token']     = ""

# The numeric id and text name of the room Jenkins should notify
default['se-jenkins']['campfire']['room_id']   = ""
default['se-jenkins']['campfire']['room_name'] = ""

# Global username and email to configure the Git plugin with
default['se-jenkins']['git']['email'] = "StreetEasy"
default['se-jenkins']['git']['name']  = "dev@streeteasy.com"

default['se-jenkins']['default_job_config'] = {
  artifacts:       ['*.log', '*.html'],
  branches:        ['**'],
  build_command:   'script/ci',
  include_recipes: [],
  ruby_versions:   []
}
