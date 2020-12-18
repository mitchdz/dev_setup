$script = <<-SCRIPT
sudo apt-get update -y
sudo apt-get install -y build-essential git
mkdir -p /home/vagrant/dev_setup/
cp -r /vagrant/* /home/vagrant/dev_setup/
chown -R vagrant:vagrant /home/vagrant/dev_setup/
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/groovy64"
  config.vm.hostname = "mitch-dev-setup"
  config.vm.provision "shell", inline: $script
end
