require 'berkshelf/thor'
require 'kitchen/thor_tasks'
require 'thor/scmversion'

Kitchen::ThorTasks.new

class Cookbook < Thor
  desc "release", "Tag a release and upload to the chef-server"
  def release(type = 'auto')
    @current_version = nil
    system "git pull --rebase && git push"
    invoke "version:bump", [type]
    invoke "berkshelf:upload"
  end

  class Test < Thor
    desc "all", "Run all tests"
    def all
      invoke "cookbook:test:knife"
      invoke "cookbook:test:foodcritic"
      invoke "cookbook:test:spec"
      invoke "kitchen:all"
    end

    desc "foodcritic", "Run foodcritic linter"
    def foodcritic
      system "foodcritic -f any ."
    end

    desc "knife", "Run knife test cookbook"
    def knife
      cookbook_name = File.expand_path('.').split('/').last
      system "knife cookbook test -o .. #{cookbook_name}"
    end

    desc "spec", "Run RSpec tests"
    def spec
      system 'rspec'
    end
  end
end
