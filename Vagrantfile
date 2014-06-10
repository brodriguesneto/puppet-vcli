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
  config.vm.define "precise" do |precise|
    precise.vm.box              = "ubuntu/precise64"
    precise.vm.box_check_update = true
    precise.vm.provision        :file,  source: $gitconfig, destination: "/home/vagrant/.gitconfig"
    precise.vm.provision        :file,  source: $vimrc,     destination: "/home/vagrant/.vimrc"
    precise.vm.provision        :file,  source: $bashrc,    destination: "/home/vagrant/.bashrc"
    precise.vm.provision        :shell, path: "vagrant_ubuntu_bootstrap.sh"
  end
  
  config.vm.define "trusty" do |trusty|
    trusty.vm.box              = "ubuntu/trusty64"
    trusty.vm.box_check_update = true
    trusty.vm.provision        :file,  source: $gitconfig, destination: "/home/vagrant/.gitconfig"
    trusty.vm.provision        :file,  source: $vimrc,     destination: "/home/vagrant/.vimrc"
    trusty.vm.provision        :file,  source: $bashrc,    destination: "/home/vagrant/.bashrc"
    trusty.vm.provision        :shell, path: "vagrant_ubuntu_bootstrap.sh"
  end
  
end
