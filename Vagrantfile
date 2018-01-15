# -*- mode: ruby -*-
# vi: set ft=ruby :

unless Vagrant.has_plugin?("vagrant-docker-compose")
  system("vagrant plugin install vagrant-docker-compose")
  puts "Dependencies installed, please try the command again."
  exit
end

Vagrant.configure("2") do |config|
  
  config.vm.hostname = "dockgrant"

  ### Search more Vagrant boxex: https://app.vagrantup.com/boxes/search
  config.vm.box = "ubuntu/xenial64"

  config.vm.provider :virtualbox do |vb|
    vb.name = "dockgrant"
    vb.memory = "8000"
  end
  
  config.vm.network "private_network", ip: "192.168.33.10"
  
  config.vm.synced_folder "~/Sites", "/opt", type: "nfs"
  
  config.vm.provision "docker"
  config.vm.provision "shell", path: "./docker-tcp.sh"
  
  config.vm.provision :docker_compose
  
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = 'playbook.yml'
  end

  config.ssh.forward_agent = true
  
end
