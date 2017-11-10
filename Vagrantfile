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
  config.vm.box = "base"

  config.vm.provider :virtualbox do |vb|
    vb.name = "dockgrant"
    vb.memory = "1024"
  end
  
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  
  config.vm.synced_folder "./dockgrant", "/dockgrant", type: "nfs"
  
  config.vm.provision "docker"
  config.vm.provision "shell", path: "./docker-tcp.sh"
  
  config.vm.provision :docker_compose, yml: "/dockgrant/docker-compose.yml", rebuild: true, run: "always"
  
end
