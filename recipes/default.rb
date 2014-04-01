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

include_recipe "#{cookbook_name}::repo"
include_recipe 'java'

if node['katello']['enable_foreman']
  pkg_name = 'katello-foreman-all'

  if platform?('fedora')
    include_recipe 'selinux::disabled' # That's what they say
  end

else
  pkg_name = 'katello-all'
end

package pkg_name do
  action :install
end
