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

include_recipe "jenkins::server"
