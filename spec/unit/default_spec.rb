require 'spec_helper'

describe 'katello::default' do

  let(:chef_run) { ChefSpec::Runner.new(:platform => 'redhat', :version => '6.5').converge(described_recipe) }

  it 'includes the Java recipe' do
    expect(chef_run).to include_recipe('java')
  end

  it 'includes the repo recipe' do
    expect(chef_run).to include_recipe('katello::repo')
  end

  context 'when Foreman is enabled' do
    let(:chef_run) do
      r = ChefSpec::Runner.new(:platform => 'redhat', :version => '6.5')
      r.node.set['katello']['enable_foreman'] = true
      r.converge(described_recipe)
    end

    it 'installs the correct packages' do
      expect(chef_run).to install_package('katello-foreman-all')
      expect(chef_run).not_to install_package('katello-all')
    end

    context 'on Fedora' do
      let(:chef_run) do
        r = ChefSpec::Runner.new(:platform => 'fedora', :version => '19')
        r.node.set['katello']['enable_foreman'] = true
        r.converge(described_recipe)
      end

      it 'disables SELinux' do
        expect(chef_run).to include_recipe('selinux::disabled')
      end
    end
  end

  context 'when Foreman is not enabled' do
    let(:chef_run) do
      r = ChefSpec::Runner.new(:platform => 'redhat', :version => '6.5')
      r.node.set['katello']['enable_foreman'] = false
      r.converge(described_recipe)
    end

    it 'installs the correct packages' do
      expect(chef_run).to install_package('katello-all')
      expect(chef_run).not_to install_package('katello-foreman-all')
    end

  end
end