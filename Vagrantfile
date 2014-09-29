# -*- mode: ruby -*-i
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  (1..3).each do |i|
    config.vm.define "zoo#{i}" do |c|
      
      c.vm.box = "hashicorp/precise64"

      c.vm.hostname = "zoo#{i}"

      c.vm.network "private_network", ip: "192.168.60.#{i+1}"
      c.vm.network "forwarded_port", guest: 9090, host: (9959 + i)

      c.vm.provision "puppet" do |puppet|
        puppet.module_path = "modules"
      end

      c.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
      end
    end
 end
end

