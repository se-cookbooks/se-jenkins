require 'spec_helper'

describe 'se-jenkins::default' do
  let(:chef_run) { ChefSpec::ChefRunner.new(platform: 'ubuntu', version: '12.04').converge('se-jenkins::default') }

  it 'uses the jenkins::server recipe' do
    expect(chef_run).to include_recipe('jenkins::server')
  end
end
