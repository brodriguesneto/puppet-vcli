# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant Share Feature
#Vagrant.require_version ">= 1.5.0"

# Vagrant API
VAGRANTFILE_API_VERSION = "2"

# Method to provisioning files to vagrant's home directory
def dotfiles(file)
  dotfile = open(ENV['HOME']) + '/.' + "#{file}"
  file_provision = "suite.vm.provision :file, source: " + "#{dotfile}"
  return file_provision
end


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
  ['precise64', 'trusty64'].each do |lsbdistrelease|

    config.vm.define "#{lsbdistrelease}" do |suite|
      suite.vm.box              = "ubuntu/#{lsbdistrelease}"
      suite.vm.box_check_update = true
      dotfiles(:gitconfig)
      suite.vm.provision        :shell, path: "vagrant_ubuntu_bootstrap.sh"
    end
  end
end
