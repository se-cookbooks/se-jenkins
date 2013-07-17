require 'berkshelf'
require 'chefspec'
require 'fileutils'

# Turn off Ruby warnings because the Windows cookbook spews bullshit.
$VERBOSE = nil

cookbook_path = File.expand_path(File.dirname(__FILE__) + "/../vendor/cookbooks")

FileUtils.rm_rf(cookbook_path)

Berkshelf.ui.mute do
  berksfile = Berkshelf::Berksfile.from_file('Berksfile')
  berksfile.install(path: cookbook_path)
end
