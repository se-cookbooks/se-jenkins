chef_api :config
site :opscode

metadata

cookbook "jenkins", github: "opscode-cookbooks/jenkins"

group :integration do
  cookbook "apt"
  cookbook "yum"
end
