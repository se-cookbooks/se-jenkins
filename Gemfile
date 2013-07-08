source 'https://rubygems.org'

gem 'foodcritic'
gem 'berkshelf'
gem 'thor-foodcritic'
gem 'thor-scmversion'

group :integration do
  gem 'test-kitchen', :git => "git://github.com/opscode/test-kitchen.git"
  gem 'kitchen-vagrant', :git => "git://github.com/opscode/kitchen-vagrant.git"

  # Change .kitchen.yml's driver_plugin to ec2 and populate
  # .kitchen.local.yml's driver_config with aws auth data
  gem 'kitchen-ec2', :git => "git://github.com/opscode/kitchen-ec2.git"
end
