# LAMP Stack with Ansible on Vagrant (LAMP-Laravel Ready)

This README outlines how to set up a LAMP stack (Linux, Apache, MySQL, PHP) on a virtual machine with a secondary slave node for potential scaling, suitable for deploying a Laravel application.

## Requirements

Ensure you have the following software installed before you begin the setup:

1. **Vagrant** - Used for building and managing virtual machine environments in a single workflow. [Download Vagrant here](https://developer.hashicorp.com/vagrant).
2. **VirtualBox** - A free and open-source hosted hypervisor for x86 virtualization. [Download VirtualBox here](https://www.virtualbox.org/wiki/Downloads).
3. **Ansible** - An open-source software provisioning, configuration management, and application-deployment tool enabling infrastructure as code. [Learn more about Ansible here](https://www.ansible.com/).


## Features

This project automates the setup of a development environment with the following features:

- **Automated VM Creation**: Uses Vagrant to create and manage a master and a slave virtual machine, streamlining the development and testing environments setup.
- **LAMP Stack Installation**: Automatically installs the Linux, Apache, MySQL, and PHP (LAMP) stack on both virtual machines using Ansible, ensuring a consistent and repeatable environment for web development.
- **Inventory Management**: Utilizes an Ansible inventory file to define and configure the virtual machines, which simplifies the management of multiple environments or configurations.
- **Configurable Playbook**: Provides a sample Ansible playbook to configure the slave node. This playbook can be modified to deploy and manage a Laravel application or other web applications as needed.

## Getting Started

This section provides detailed instructions on how to set up and start using the environment. Follow these steps to get everything running smoothly:

### Prerequisites

Ensure you have Vagrant and VirtualBox installed on your system. You can download them from:

- [Vagrant](https://www.vagrantup.com/downloads.html)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

### Clone the Repository

Clone the project repository to get the required files on your local machine:

```bash
git clone https://github.com/your-username/lamp-laravel-deployment.git
```
## Install Dependencies
Install necessary Vagrant plugins to ensure proper functionality:

```bash
vagrant plugin install vagrant-vbguest
```

## Configuration (Optional)

1. Edit the Vagrantfile to adjust memory, CPU cores, or hostname for the virtual machines according to your needs.
2. Modify the configure_slave_node.yml playbook to tailor the configuration of the slave node for your specific application requirements.
3. Update the inventory.ini file if the default IP addresses for your virtual machines need to be changed.

## Start the VMs
Launch the virtual machines using Vagrant:

```bash
vagrant up
```

## Manually Run the Ansible Playbook
After the virtual machines are up and running, you can manually configure them using Ansible:

### 1. Connect to the master node:

```bash
vagrant ssh master
```

### 2. Navigate to the directory containing the` configure_slave_node.yml` and `inventory.ini` files:

```bash
cd /path/to/directory
```

### 3. Execute the Ansible playbook:

```bash
ansible-playbook -i inventory.ini configure_slave_node.yml
```

Follow these steps to ensure your development environment is set up correctly and ready for further development and testing.


## Further Notes
- This is a basic setup for LAMP deployment with Ansible and Vagrant. You might need to modify the provided scripts and configuration based on your specific Laravel application requirements.
- Security aspects are not covered in this example. Consider implementing proper security measures for production environments

