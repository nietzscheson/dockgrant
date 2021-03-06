# -*- mode: ruby -*-
# vi: set ft=ruby :

unless Vagrant.has_plugin?("vagrant-docker-compose")
  system("vagrant plugin install vagrant-docker-compose")
  puts "Dependencies installed, please try the command again."
  exit
end

system('./ssh-agent.sh')

Vagrant.configure("2") do |config|
  
  config.vm.hostname = "dockgrant"

  ### Search more Vagrant boxex: https://app.vagrantup.com/boxes/search
  config.vm.box = "ubuntu/xenial64"

  config.vm.provider :virtualbox do |vb|
    vb.name = "dockgrant"
    vb.memory = "8000"
  end
  
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  
  config.vm.synced_folder "~/Sites", "/opt", 
    type: "nfs",
    map_uid: 0, 
    map_gid: 0
  
  config.vm.provision "docker"
  config.vm.provision "shell", path: "./docker-tcp.sh"
  
  config.vm.provision :docker_compose
  
  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = 'playbook.yml'
  end

  config.ssh.forward_agent = true
  
end
