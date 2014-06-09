# == Class: vcli
#
# Full description of class vcli here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { vcli:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class vcli {
  package { [
    'ia32-libs',
    'libxml-libxml-perl',
    'libclass-methodmaker-perl',
    'libcrypt-ssleay-perl',
    'perl-doc',
    'libarchive-zip-perl',
    'libsoap-lite-perl',
    'libdata-dump-perl',
    'libuuid-perl',
    'libssl-dev']:
    ensure => 'present',
  }

  file { '/usr/local/src/vmware-vcli-5.1.tar.gz':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/vcli/vmware-vcli-5.1.tar.gz',
    require => Package[
      'ia32-libs',
      'libxml-libxml-perl',
      'libclass-methodmaker-perl',
      'libcrypt-ssleay-perl',
      'perl-doc',
      'libarchive-zip-perl',
      'libsoap-lite-perl',
      'libdata-dump-perl',
      'libuuid-perl',
      'libssl-dev'
    ],
  }

  exec { 'tar vxzf vmware-vcli-5.1.tar.gz && vmware-vsphere-cli-distrib/vmware-install.pl --default':
    path      => '/usr/bin:/usr/sbin:/bin',
    cwd       => '/usr/local/src',
    provider  => 'shell',
    subscribe => File['/usr/local/src/vmware-vcli-5.1.tar.gz'],
  }

}
