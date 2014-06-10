class vcli::config {
  file { '/usr/local/src/vmware-vcli-5.1.tar.gz':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/vcli/vmware-vcli-5.1.tar.gz',
    require => Package[$vcli::params::packages],
  }

  exec { 'tar vxzf vmware-vcli-5.1.tar.gz && vmware-vsphere-cli-distrib/vmware-install.pl --default':
    path      => '/usr/bin:/usr/sbin:/bin',
    cwd       => '/usr/local/src',
    provider  => 'shell',
    subscribe => File['/usr/local/src/vmware-vcli-5.1.tar.gz'],
  }
}
