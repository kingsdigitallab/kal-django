# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.insert_key = false

  config.vm.box = "puphpet/debian75-x64"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = ".vagrant_provisioning/playbook.yml"
    # ansible.tags = ""
    # ansible.verbose = "vvv"
  end

  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.vm.network "forwarded_port", guest: 5432, host: 5432
  config.vm.network "forwarded_port", guest: 9200, host: 9200

  config.vm.network "private_network", ip: "192.168.33.99"

  config.vm.provider "virtualbox" do |provider|
    provider.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provider "vmware" do |provider|
    provider.customize ["modifyvm", :id, "--memory", "1024"]
  end

  # vagrant-hostupdater configuration
  config.vm.define "kal" do |machine|
    machine.vm.box = "puphpet/debian75-x64"
    machine.vm.hostname = "kal.vagrant"
    machine.vm.network "private_network", ip: "192.168.33.99"
  end
end
