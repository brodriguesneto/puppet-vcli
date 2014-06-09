# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant Share Feature
Vagrant.require_version ">= 1.5.0"

# Vagrant API
VAGRANTFILE_API_VERSION = "2"

# Variable to set config.vm.hostname
$my_name = File.open("manifests/init.pp","r").grep(/class /).to_s.split(" ")[-2]

# Variables to set the source of file provision to copy from
$gitconfig = open(ENV['HOME'] + '/.gitconfig')
$vimrc     = open(ENV['HOME'] + '/.vimrc')
$bashrc    = open(ENV['HOME'] + '/.bashrc')

# Vagrant main configuration
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  ### VirtualBox Provider configuration
  config.vm.provider "virtualbox" do |vbox|
    vbox.memory = 512
    vbox.cpus   = 2
  end

  ### VM configuration
  config.vm.box              = "ubuntu/trusty64"
  config.vm.box_check_update = true
  config.vm.hostname         = $my_name

  ### Network configuration
  # Bridge network
  #config.vm.network "public_network"
  # SSH agent
  config.ssh.forward_agent   = true

  ### Synced Folder
  # VirtualBox example:
  #config.vm.synced_folder "/local/folder", "/guest/folder"

  ### Provisioning
  # File provision
  config.vm.provision	     :file, source: $gitconfig, destination: "/home/vagrant/.gitconfig"
  config.vm.provision	     :file, source: $vimrc,     destination: "/home/vagrant/.vimrc"
  config.vm.provision	     :file, source: $bashrc,    destination: "/home/vagrant/.bashrc"
  config.vm.provision      :file, source: $gitconfig, destination: "/root/.gitconfig"
  config.vm.provision      :file, source: $vimrc,     destination: "/root/.vimrc"
  config.vm.provision      :file, source: $bashrc,    destination: "/root/.bashrc"
  # Shell provision
  config.vm.provision        :shell, path: "vagrant_ubuntu_bootstrap.sh"

end
