node.set['jenkins']['server']['version']      = '1.522'
node.set['jenkins']['server']['war_checksum'] = 'e227c291191b2554267b4b338ea34ef86a9aa42096928e42bebdf6e90cf3e314'

node.set['jenkins']['server']['plugins'] = %w(
  campfire
  git
  git-client
  github
  github-api
  github-oauth
  javadoc
  mailer
  rake
  token-macro
)

include_recipe "git"
include_recipe "jenkins::server"

# Install all the Rubies that we use
include_recipe "se-ruby::ruby18"
include_recipe "se-ruby::ruby19"
include_recipe "se-ruby::ruby20"
include_recipe "se-ruby"

# TODO:
# - add git config (hudson.plugins.git.GitSCM.xml)
# - add campfire config (hudson.plugins.campfire.CampfireNotifier.xml)

include_recipe "se-jenkins::_ssh_keys"
include_recipe "se-jenkins::_bundler_config"
