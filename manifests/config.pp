class vcli::config {
  file { '/usr/local/src/vmware-vcli-5.1.tar.gz':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/vcli/vmware-vcli-5.1.tar.gz',
    require => Package[$vcli::params::packages],
    notify  => Exec[$vcli::params::exec_cmd]
  }
}
