chef_api :config
site :opscode

metadata

cookbook "jenkins",
  #github: "opscode-cookbooks/jenkins"
  path: "/Users/jd/src/cookbooks/jenkins"

cookbook "docker",
  github: "bflad/chef-docker"

cookbook "lxc",
  path: "/Users/jd/src/cookbooks/lxc"

group :integration do
  cookbook "apt"
  cookbook "yum"
end
