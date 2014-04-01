require 'spec_helper'

describe 'katello::repo' do

  let(:chef_run) do
    runner = ChefSpec::Runner.new(:platform => 'fedora', :version => '19')
    runner.node.set['katello']['repo']['url'] = 'http://bogus.com/katello-repos-314159.noarch.rpm'
    runner.converge(described_recipe)
  end

  it 'downloads the repository file' do
    expect(chef_run).to create_remote_file("#{Chef::Config[:file_cache_path]}/katello-repos-314159.noarch.rpm")
  end

  it 'installs the repository' do
    expect(chef_run).to install_yum_package('katello-repos')
  end

  context 'when on RHEL' do
    let(:chef_run) { ChefSpec::Runner.new(:platform => 'redhat', :version => '6.5').converge(described_recipe) }

    it 'includes the EPEL recipe' do
      expect(chef_run).to include_recipe('yum-epel')
    end
  end

  context 'when on CentOS' do
    let(:chef_run) { ChefSpec::Runner.new(:platform => 'centos', :version => '6.5').converge(described_recipe) }
  end

end
