class vcli::params {
  case $::operatingsystem {
    'Ubuntu' : {
      case $::lsbdistrelease {
        /12.04/ : {
          $packages = [
            'ia32-libs',
            'libxml-libxml-perl',
            'libclass-methodmaker-perl',
            'libcrypt-ssleay-perl',
            'perl-doc',
            'libarchive-zip-perl',
            'libsoap-lite-perl',
            'libdata-dump-perl',
            'libuuid-perl',
            'libssl-dev']
        }
        /14.04/ : {
          $packages = [
            'libxml-libxml-perl:i386',
            'libclass-methodmaker-perl:i386',
            'libcrypt-ssleay-perl:i386',
            'perl-doc:i386',
            'libarchive-zip-perl:i386',
            'libsoap-lite-perl:i386',
            'libdata-dump-perl:i386',
            'libuuid-perl:i386',
            'libssl-dev:i386']
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
