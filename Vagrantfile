# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

    config.vm.define "trusty64" do |trusty64|
        trusty64.vm.box = "ubuntu/trusty64"
    end
    config.vm.define "trusty32" do |trusty32|
        trusty32.vm.box = "ubuntu/trusty32"
    end
    config.vm.define "arch" do |arch|
        arch.vm.box = "archlinux/archlinux"
    end

    config.vm.define "fedora25" do |fedora25|
        fedora25.vm.box = "fedora/25-atomic-host"
        fedora25.vm.synced_folder ".", "/vagrant", disabled: true
        fedora25.vm.synced_folder ".", "/home/vagrant/", type: "rsync"
    end

    config.vm.synced_folder ".", "/vagrant"

end
