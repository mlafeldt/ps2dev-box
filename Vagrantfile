# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # Ubuntu 10.04, 64 bit
  config.vm.box = "lucid64"
  config.vm.box_url = "http://files.vagrantup.com/lucid64.box"

  # Ubuntu 12.04, 64 bit
  # config.vm.box = "precise64"
  # config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Shell provisioner
  # config.vm.provision :shell, :path => "shell/ps2dev.sh"

  # Chef Solo provisioner
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "ps2dev"
    # chef.log_level = :debug
  end
end
