class vcli::install {
  package { $vcli::params::packages:
    ensure => $vcli::package_ensure,
  }
}
