# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.require_version ">= 1.5.0"
VAGRANTFILE_API_VERSION = "2"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  ### VM OS
  config.vm.box              = "ubuntu/trusty64"
  config.vm.box_check_update = true
  config.vm.hostname         = "puppet-vcli"
  #config.vm.name             = "puppet-vcli"
  #config.vm.memory           = 512
  #config.vm.cpus             = 2

  ### Network
  # Bridge network
  #config.vm.network "public_network"
  # SSH agent
  config.ssh.forward_agent   = true

  ### Synced Folder
  #config.vm.synced_folder ".", "/etc/puppet/modules/apcupsd"

  ### Provision
  # File provision
  config.vm.provision	     :file, source: open(ENV['HOME'] + '/.gitconfig'), destination: "/home/vagrant/.gitconfig"
  config.vm.provision	     :file, source: open(ENV['HOME'] + '/.vimrc'), destination: "/home/vagrant/.vimrc"
  config.vm.provision	     :file, source: open(ENV['HOME'] + '/.bashrc'), destination: "/home/vagrant/.bashrc"
  # Shell provision
  config.vm.provision        :shell, path: "vagrant_bootstrap.sh"

end
