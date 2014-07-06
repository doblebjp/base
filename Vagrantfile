# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "chef/ubuntu-14.04"
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024 
  end
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.synced_folder "./", "/vagrant",
    owner: "vagrant",
    group: "www-data",
    mount_options: ["dmode=775,fmode=664"]
end