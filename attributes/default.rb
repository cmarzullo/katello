#
# Cookbook Name:: katello
# Attributes:: default
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

default[:katello][:admin_password] = nil
default[:katello][:answers_path] = '/etc/katello-installer/answers.katello-installer.yaml'
default[:katello][:repolist] = %w{ 
                                  katello katello_candlepin katello_pulp 
                                  puppet puppet_deps foreman foreman_plugins
                                  scl epel_subcription_manager
                                 }

default[:java][:jdk_version] = '7'

# All the repos will need with their defaults.
# TODO Need to get the keys working
default[:yum][:katello][:baseurl] = 'http://fedorapeople.org/groups/katello/releases/yum/2.0/katello/RHEL/$releasever/$basearch/'
default[:yum][:katello][:description] = 'Katello Stable'
#default[:yum][:katello][:gpgkey] = '///etc/pki/rpm-gpg/RPM-GPG-KEY-katello-2012'
default[:yum][:katello][:gpgcheck] = false

default[:yum][:katello_candlepin][:baseurl] = 'http://fedorapeople.org/groups/katello/releases/yum/2.0/candlepin/RHEL/$releasever/$basearch/'
default[:yum][:katello_candlepin][:description] = 'An open source entitlement management system.'
#default[:yum][:katello_candlepin][:gpgkey] = '///etc/pki/rpm-gpg/RPM-GPG-KEY-katello-2012'
default[:yum][:katello_candlepin][:gpgcheck] = false

default[:yum][:katello_pulp][:baseurl] = 'http://fedorapeople.org/groups/katello/releases/yum/2.0/pulp/RHEL/$releasever/$basearch/'
default[:yum][:katello_pulp][:description] = 'An open source entitlement management system.'
#default[:yum][:katello_pulp][:gpgkey] = '///etc/pki/rpm-gpg/RPM-GPG-KEY-katello-2012'
default[:yum][:katello_pulp][:gpgcheck] = false

default[:yum][:puppet][:baseurl] = 'http://yum.puppetlabs.com/el/6/products/$basearch'
default[:yum][:puppet][:description] = 'Puppet Labs Products El 6 - $basearch'
#default[:yum][:puppet][:gpgkey] = '///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs'
default[:yum][:puppet][:gpgcheck] = false

default[:yum][:puppet_deps][:baseurl] = 'http://yum.puppetlabs.com/el/6/products/$basearch'
default[:yum][:puppet_deps][:description] = 'Puppet Labs Products El 6 - $basearch'
#default[:yum][:puppet_deps][:gpgkey] = '///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs'
default[:yum][:puppet_deps][:gpgcheck] = false

default[:yum][:scl][:baseurl] = 'http://mirror.centos.org/centos/$releasever/SCL/$basearch/'
default[:yum][:scl][:description] = 'CentOS-$releasever - SCL'
default[:yum][:scl][:gpgkey] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6'

default[:yum][:foreman][:baseurl] = 'http://yum.theforeman.org/releases/1.6/el6/$basearch'
default[:yum][:foreman][:description] = 'Foreman 1.6'
#default[:yum][:foreman][:gpgkey] = '///etc/pki/rpm-gpg/RPM-GPG-KEY-foreman'
default[:yum][:foreman][:gpgcheck] = false

default[:yum][:foreman_plugins][:baseurl] = 'http://yum.theforeman.org/plugins/1.6/el6/$basearch'
default[:yum][:foreman_plugins][:description] = 'Foreman plugins 1.6'
#default[:yum][:foreman_plugins][:gpgkey] = '///etc/pki/rpm-gpg/RPM-GPG-KEY-foreman'
default[:yum][:foreman_plugins][:gpgcheck] = false

default[:yum][:epel_subcription_manager][:baseurl] = 'http://repos.fedorapeople.org/repos/candlepin/subscription-manager/epel-$releasever/$basearch/'
default[:yum][:epel_subcription_manager][:description] = 'Tools and libraries for Red Hat subscription management.'
default[:yum][:epel_subcription_manager][:gpgcheck] = false


# Katello installer default options
default[:katello][:installer][:certs][:generate] = true
default[:katello][:installer][:certs][:deploy] = true
default[:katello][:installer][:certs][:group] = 'foreman'
default[:katello][:installer][:katello] = true
default[:katello][:installer][:foreman][:organizations_enabled] = true
default[:katello][:installer][:foreman][:locations_enabled] = true
default[:katello][:installer][:foreman][:initial_organization] = 'Default Organization'
default[:katello][:installer][:foreman][:initial_location] = 'Default Location'
default[:katello][:installer][:foreman][:custom_repo] = true
default[:katello][:installer][:foreman][:configure_epel_repo] = false
default[:katello][:installer][:foreman][:configure_scl_repo] = false
default[:katello][:installer][:foreman][:ssl] = true
default[:katello][:installer][:foreman][:server_ssl_cert] = '/etc/pki/katello/certs/katello-apache.crt'
default[:katello][:installer][:foreman][:server_ssl_key] = '/etc/pki/katello/private/katello-apache.key'
default[:katello][:installer][:foreman][:server_ssl_ca] = '/etc/pki/katello/certs/katello-default-ca.crt'
default[:katello][:installer][:foreman][:server_ssl_chain] = '/etc/pki/katello/certs/katello-default-ca.crt'
default[:katello][:installer][:foreman][:websockets_encrypt] = true
default[:katello][:installer][:foreman][:websockets_ssl_key] = '/etc/pki/katello/private/katello-apache.key'
default[:katello][:installer][:foreman][:websockets_ssl_cert] = '/etc/pki/katello/certs/katello-apache.crt'
default[:katello][:installer][:capsule][:register_in_foreman] = true
default[:katello][:installer][:capsule][:pulp_master] = true
default[:katello][:installer][:capsule][:puppet] = true
default[:katello][:installer][:capsule][:puppetca] = true

default[:katello][:installer]['foreman::plugin::bootdisk'] = true
default[:katello][:installer]['foreman::plugin::discovery'] = true
default[:katello][:installer]['foreman::plugin::hooks'] = true
default[:katello][:installer]['foreman::plugin::tasks'] = true
default[:katello][:installer]['foreman::plugin::chef'] = false
default[:katello][:installer]['foreman::plugin::default_hostgroup'] = false
default[:katello][:installer]['foreman::plugin::puppetdb'] = false
default[:katello][:installer]['foreman::plugin::setup'] = false
default[:katello][:installer]['foreman::plugin::templates'] = false




