class vcli::params {
  case $::operatingsystem {
    'Ubuntu' : {
      $exec_cmd = 'tar vxzf vmware-vcli-5.1.tar.gz && vmware-vsphere-cli-distrib/vmware-install.pl --default'
      case $::lsbdistrelease {
        /12.04/ : {
          $packages = [
            'ia32-libs',
            'libxml-libxml-perl',
            'libclass-methodmaker-perl',
            'libcrypt-ssleay-perl',
            'libarchive-zip-perl',
            'libsoap-lite-perl',
            'libdata-dump-perl',
            'libuuid-perl',
            'libssl-dev']
        }
        /14.04/ : {
          $packages = [
            'libc6:i386',
            'libxml-libxml-perl',
            'libclass-methodmaker-perl',
            'libcrypt-ssleay-perl',
            'libarchive-zip-perl',
            'libsoap-lite-perl',
            'libdata-dump-perl',
            'libuuid-perl',
            'libssl-dev',]
        }
        default : {
          case $::lsbdistrelease {
            default : { fail("Unsupported Ubuntu suite: ${::lsbdistrelease}") }
          }
        }
      }
    }
    default  : {
      case $::operatingsystem {
        default : { fail("Unsupported operating system: ${::operatingsystem}") }
      }
    }
  }
}
