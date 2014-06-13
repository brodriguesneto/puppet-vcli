# == Class: vcli
class vcli ($ensure = 'present', $autoupgrade = false) inherits vcli::params {
  case $ensure {
    /(present)/ : {
      if $autoupgrade == true {
        $package_ensure = 'latest'
      } else {
        $package_ensure = 'present'
      }
    }
    /(absent)/  : {
      $package_ensure = 'absent'
    }
    default     : {
      fail('ensure parameter must be present or absent')
    }
  }

  include vcli::dependencies, vcli::tarball, vcli::install
  Class['vcli::dependencies'] -> Class['vcli::tarball'] ~> Class['vcli::install']
}
