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
          $exec_cmd = 'tar vxzf vmware-vcli-5.1.tar.gz && vmware-vsphere-cli-distrib/vmware-install.pl --default'
        }
        /14.04/ : {
          $packages = [
            'libxml-libxml-perl',
            'libclass-methodmaker-perl',
            'libcrypt-ssleay-perl',
            'perl-doc',
            'libarchive-zip-perl',
            'libsoap-lite-perl',
            'libdata-dump-perl',
            'libuuid-perl',
            'libssl-dev',
            'fontconfig-config',
            'fonts-dejavu-core',
            'gcc-4.9-base:i386',
            'libc6:i386',
            'libexpat1:i386',
            'libfontconfig1:i386',
            'libfreetype6:i386',
            'libgcc1:i386',
            'libgd3:i386',
            'libjbig0:i386',
            'libjpeg-turbo8:i386',
            'libjpeg8:i386',
            'liblzma5:i386',
            'libpng12-0:i386',
            'libtiff5:i386',
            'libvpx1',
            'libwrap0:i386',
            'libx11-6:i386',
            'libxau6:i386',
            'libxcb1:i386',
            'libxdmcp6:i386',
            'libxpm4:i386',
            'zlib1g:i386',]
          $exec_cmd = 'tar vxzf vmware-vcli-5.1.tar.gz && vmware-vsphere-cli-distrib/vmware-install.pl --default'
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
