campfire = data_bag_item('campfire', 'config')
github   = data_bag_item('github', 'credentials')
jenkins  = data_bag_item('jenkins', 'ssh_key')

node.set['se-jenkins']['ssh_key'] = jenkins['private_key']

node.set['se-jenkins']['github']['client_id'] = github['client_id']
node.set['se-jenkins']['github']['client_secret'] = github['client_secret']
node.set['se-jenkins']['github']['oauth_token'] = github['oauth_token']

node.set['se-jenkins']['campfire']['account'] = campfire['account']
node.set['se-jenkins']['campfire']['room_id'] = campfire['room_id']
node.set['se-jenkins']['campfire']['room_name'] = campfire['room_name']
node.set['se-jenkins']['campfire']['token'] = campfire['token']
