chef_api :config
site :opscode

metadata

cookbook "docker",
  github: "bflad/chef-docker"

group :integration do
  cookbook "apt"
  cookbook "yum"
end
