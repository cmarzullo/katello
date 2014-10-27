#
# Cookbook Name:: katello
# Attributes:: repo
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

default[:katello][:repo][:managed] = true

#case node['platform_family']
#when 'fedora'
#  case node['platform_version'].to_i
#  when 19
#    default['katello']['repo']['url'] = 'http://fedorapeople.org/groups/katello/releases/yum/1.4/Fedora/19/x86_64/katello-repos-latest.rpm'
#  end
#when 'rhel'
#  default['katello']['repo']['url'] = 'https://fedorapeople.org/groups/katello/releases/yum/2.0/katello/RHEL/6/x86_64/katello-repos-latest.rpm'
#  default['katello']['foremanrepo']['url'] = 'http://yum.theforeman.org/releases/1.6/el6/x86_64/foreman-release.rpm'
#  default['katello']['puppetrepo']['url'] = 'http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm'
#end

default['katello']['repo']['sub_manager_source'] = false

