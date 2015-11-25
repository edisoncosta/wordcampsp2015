Vagrant.configure(2) do |config|

  config.vm.box = "debian/jessie64"
  config.vm.hostname = "agiuscloud.com"
 
  config.vm.network "public_network", ip: "192.168.1.150"
 
  config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.network "forwarded_port", guest: 443, host: 443
  config.vm.network "forwarded_port", guest: 22222, host: 22222
 
  config.vm.synced_folder "/Dropbox/server/agiuscloud", "/var/www/", owner: "root", group: "root"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
     vb.name = "AgiusCloud"
  end
 
  config.vm.provision "shell" do |s|
    s.path "provision/setup.sh"
  end
 
end
