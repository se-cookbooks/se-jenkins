node.set['jenkins']['server']['version']      = '1.522'
node.set['jenkins']['server']['war_checksum'] = 'e227c291191b2554267b4b338ea34ef86a9aa42096928e42bebdf6e90cf3e314'

node.set['jenkins']['server']['plugins'] = %w(git git-client)

include_recipe "jenkins::server"
