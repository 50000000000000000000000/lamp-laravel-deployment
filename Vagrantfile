# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Update the box version or verify it's the latest
  config.vm.box = "ubuntu/focal64"
  config.vm.box_check_update = true

  # Master VM configuration
  config.vm.define "master" do |master|
    master.vm.network "private_network", ip: "192.168.50.4"
    master.vm.hostname = "master"
    
    master.vm.provision "file", source: "./install_lamp.sh", destination: "/home/vagrant/install_lamp.sh"

    # VirtualBox-specific configurations
    master.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
      vb.gui = false  # Set to true if you need to troubleshoot the VM's boot process
    end

    # Increase boot timeout to allow more time for VM to start
    master.vm.boot_timeout = 600
  end

  # Slave VM configuration
  config.vm.define "slave" do |slave|
    slave.vm.network "private_network", ip: "192.168.50.5"
    slave.vm.hostname = "slave"

    slave.vm.provision "file", source: "./install_lamp.sh", destination: "/home/vagrant/install_lamp.sh"

    # VirtualBox-specific configurations
    slave.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
      vb.gui = false  # Set to true if you need to troubleshoot the VM's boot process
    end

    # Increase boot timeout for the slave as well
    slave.vm.boot_timeout = 600
  end

  # Global VirtualBox settings (if applicable to both)
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
  end
end
