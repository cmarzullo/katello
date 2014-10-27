name             'katello'
maintainer       'Chef Software, Inc.'
maintainer_email 'jdunn@getchef.com'
license          'Apache 2.0'
description      'Installs and configures Katello'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.1'

%w( centos ).each do |p|
  supports p
end

%w( java openssl yum yum-epel iptables ).each do |d|
  depends d
end

# 0.8.x broke support for Fedora
depends 'selinux', '< 0.8.0'
