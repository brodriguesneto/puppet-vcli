 class vcli::compile {
  exec { $vcli::params::exec_cmd:
    path      => '/usr/bin:/usr/sbin:/bin',
    cwd       => '/usr/local/src',
    provider  => 'shell',
    subscribe => File['/usr/local/src/vmware-vcli-5.1.tar.gz'],
  }
}
