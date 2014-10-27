#
# Cookbook Name:: katello
# Recipe:: default
#
# Copyright (C) 2014 Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Not sure what this does. commenting out for now
#::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)

# Setup Repos
include_recipe "#{cookbook_name}::repo"

# Install Java
include_recipe 'java'

# Firewall
# TODO make this a toggle
include_recipe 'iptables'
iptables_rule 'katello'

# Install Katello
package 'katello' do
  action :install
end

# Copy in the answers file
template '/etc/katello-installer/answers.katello-installer.yaml' do
  source 'answers.katello-installer.yaml.erb'
  action :create
  variables(:config => node[:katello][:installer])
end

# Run the installer
#execute '/usr/sbin/katello-installer' do
log 'RUNNING /usr/sbin/katello-installer' do
  not_if "hammer -u admin -p #{node[:katello][:installer][:foreman][:admin_password]} status"
end

#node.set_unless['katello']['admin_password'] = secure_password

#if node['katello']['enable_foreman']
#  pkg_name = 'katello-foreman-all'
#
#  if platform?('fedora')
#    include_recipe 'selinux::disabled' # That's what they say
#  end
#
#else
#  pkg_name = 'katello-all'
#end

# Using Chef to patch Puppet manifests... LOL.
# (Puppet manifest chowns pg_hba.conf to root:root so that Postgres won't start)
#cookbook_file '/usr/share/katello/install/puppet/modules/postgres/manifests/config.pp' do
#  source 'config.pp'
#  owner 'root'
#  group 'root'
#  mode '00644'
#  action :create
#end

#template '/etc/katello-installer/chef-answers.katello-installer.yaml' do
#end

#execute 'katello-configure' do
#  command "/usr/sbin/katello-configure -b --user-pass=#{node['katello']['admin_password']}"
#  creates '/etc/katello/katello-configure.conf'
#  action :run
#end

## Should already be started, but never hurts to make sure
#service 'postgresql' do
#  action [:enable, :start]
#end

## Drives the thin webserver as well as all the other deps like signo
#service 'katello' do
#  action [:enable, :start]
#end
