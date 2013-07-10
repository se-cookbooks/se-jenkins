require_relative 'spec_helper'

describe 'se-jenkins::default' do
  let(:chef_run) { ChefSpec::ChefRunner.new(platform: 'ubuntu', version: '12.04').converge('se-jenkins::default') }

  it 'sets the version' do
    expect(chef_run.node['jenkins']['server']['version']).to match(/\d+\.\d+/)
  end

  it 'sets the checksum' do
    expect(chef_run.node['jenkins']['server']['war_checksum']).not_to be_blank
  end

  %w(campfire git git-client github github-api github-oauth javadoc mailer rake token-macro).each do |plugin|
    it "includes the #{plugin} plugin" do
      expect(chef_run.node['jenkins']['server']['plugins']).to include(plugin)
    end
  end

  it 'uses the jenkins::server recipe' do
    expect(chef_run).to include_recipe('jenkins::server')
  end
end
