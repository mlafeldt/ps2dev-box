# vi: set ft=ruby :

Vagrant.require_plugin "vagrant-omnibus"

Vagrant.configure("2") do |config|
  # Ubuntu 10.04, 64 bit
  config.vm.box = "lucid64"
  config.vm.box_url = "http://files.vagrantup.com/lucid64.box"

  # Ubuntu 12.04, 64 bit
  # config.vm.box = "precise64"
  # config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Give the VM enough RAM
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", 1024]
  end

  # Install Chef using vagrant-omnibus plugin
  config.omnibus.chef_version = "11.6.2"

  # Shell provisioner
  # config.vm.provision :shell, :path => "shell/ps2dev.sh"

  # Chef Solo provisioner
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "vendor/cookbooks"
    chef.add_recipe "apt"
    chef.add_recipe "ps2dev"
  end
end
