# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    # Every Vagrant development environment requires a box. You can search for
    # boxes at https://vagrantcloud.com/search.
    config.vm.box = "ubuntu/xenial64"

    config.vm.network :forwarded_port, guest: 3000, host: 3000, host_ip: "127.0.0.1"

    config.vm.provision :shell, :path	=> "puppet/puppet_prep.sh"

    config.vm.provision :puppet do |puppet|
        puppet.environment_path = "puppet/environments"
        puppet.environment = "local"
    end

    config.vm.provision "shell",
        inline: "rm -f /vagrant/ubuntu-*-cloudimg-console.log",
        privileged: false,
        run: "always"

end
