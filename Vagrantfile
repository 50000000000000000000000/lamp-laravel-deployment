# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Define shared VirtualBox configuration
  vb_config = { memory: "2048", cpus: 2, gui: false }

  config.vm.box = "ubuntu/focal64"
  config.vm.box_check_update = true

  # Master VM configuration
  config.vm.define "master" do |master|
    master.vm.network "private_network", ip: "192.168.50.4"
    master.vm.hostname = "master"

    master.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install ansible -y
    SHELL

    # Copy necessary files to the master VM
    master.vm.provision "file", source: "./install_lamp.sh", destination: "/home/vagrant/install_lamp.sh"
    master.vm.provision "file", source: "./configure_slave_node.yml", destination: "/home/vagrant/configure_slave_node.yml"
    master.vm.provision "file", source: "./inventory.ini", destination: "/home/vagrant/inventory.ini"

    # VirtualBox-specific configurations
    master.vm.provider "virtualbox" do |vb|
      vb.memory = vb_config[:memory]
      vb.cpus = vb_config[:cpus]
      vb.gui = vb_config[:gui]
    end

    # Increase boot timeout to allow more time for VM to start
    master.vm.boot_timeout = 600
  end

  # Slave VM configuration
  config.vm.define "slave" do |slave|
    slave.vm.network "private_network", ip: "192.168.50.5"
    slave.vm.hostname = "slave"

    slave.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install ansible -y
    SHELL

    # Copy necessary files to the slave VM
    slave.vm.provision "file", source: "./install_lamp.sh", destination: "/home/vagrant/install_lamp.sh"

    # VirtualBox-specific configurations
    slave.vm.provider "virtualbox" do |vb|
      vb.memory = vb_config[:memory]
      vb.cpus = vb_config[:cpus]
      vb.gui = vb_config[:gui]
    end

    # Increase boot timeout for the slave as well
    slave.vm.boot_timeout = 600
  end
end
