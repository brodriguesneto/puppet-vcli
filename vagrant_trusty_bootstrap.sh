#!/bin/sh
/usr/bin/aptitude update > /dev/null 2>&1
/usr/bin/aptitude -y install vim vim-puppet puppet-lint git > /dev/null 2>&1
/bin/su  vagrant -c "/usr/bin/vim-addon-manager install puppet" > /dev/null 2>&1
/bin/ln -s /vagrant /etc/puppet/modules/`cat /vagrant/manifests/init.pp  |grep  "^class" |cut -d " " -f 2`
