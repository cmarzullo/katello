require 'spec_helper'

describe 'katello::repo' do

  context 'when on Fedora' do
    let(:chef_run) do
      runner = ChefSpec::Runner.new
      runner.node.set['katello']['repo']['url'] = 'http://bogus.com/katello-repos-314159.fc19.noarch.rpm'
      runner.converge(described_recipe)
    end

    it 'downloads the repository file' do
      expect(chef_run).to create_remote_file("#{Chef::Config[:file_cache_path]}/katello-repos-314159.fc19.noarch.rpm")
    end

    it 'installs the repository' do
      expect(chef_run).to install_yum_package('katello-repos')
    end
  end

  context 'when on RHEL' do
    let(:chef_run) do
      runner = ChefSpec::Runner.new(:platform => 'redhat', :version => '6.5')
      runner.node.set['katello']['repo']['url'] = 'http://bogus.com/katello-repos-314159.el6.noarch.rpm'
      runner.converge(described_recipe)
    end

    it 'includes the EPEL recipe' do
      expect(chef_run).to include_recipe('yum-epel')
    end

    it 'downloads the repository file' do
      expect(chef_run).to create_remote_file("#{Chef::Config[:file_cache_path]}/katello-repos-314159.el6.noarch.rpm")
    end

    it 'installs the repository' do
      expect(chef_run).to install_yum_package('katello-repos')
    end
  end

  context 'when on CentOS' do
    let(:chef_run) do
      runner = ChefSpec::Runner.new(:platform => 'centos', :version => '6.5')
      runner.node.set['katello']['repo']['url'] = 'http://bogus.com/katello-repos-314159.el6.noarch.rpm'
      runner.converge(described_recipe)
    end

    it 'includes the EPEL recipe' do
      expect(chef_run).to include_recipe('yum-epel')
    end

    it 'creates a repository for epel-rhsm' do
      expect(chef_run).to create_yum_repository('epel-subscription-manager')
    end

    it 'creates a repository for epel-rhsm-source' do
      expect(chef_run).to create_yum_repository('epel-subscription-manager-source')
    end

    it 'downloads the repository file' do
      expect(chef_run).to create_remote_file("#{Chef::Config[:file_cache_path]}/katello-repos-314159.el6.noarch.rpm")
    end

    it 'installs the repository' do
      expect(chef_run).to install_yum_package('katello-repos')
    end
  end

end
