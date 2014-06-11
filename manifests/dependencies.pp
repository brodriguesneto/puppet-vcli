class vcli::dependencies {
  package { $vcli::params::packages:
    ensure => $vcli::package_ensure,
  }
}
