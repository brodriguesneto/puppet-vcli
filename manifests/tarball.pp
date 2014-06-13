class vcli::tarball {
  file { '/usr/local/src/vmware-vcli-5.1.tar.gz':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => "puppet:///modules/${module_name}/vmware-vcli-5.1.tar.gz",
    require => Class['vcli::dependencies'],
    notify  => Class['vcli::install'],
  }
}
