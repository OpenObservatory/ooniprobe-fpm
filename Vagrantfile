# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

    config.vm.define "trusty64" do |trusty64|
        config.vm.box = "ubuntu/trusty64"
    end
    config.vm.define "trusty32" do |trusty32|
        config.vm.box = "ubuntu/trusty32"
    end

    config.vm.synced_folder ".", "/vagrant"
end
