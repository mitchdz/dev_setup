$script = <<-SCRIPT
sudo apt-get update -y
sudo apt-get install -y build-essential git
git clone https://github.com/mitchdz/dev_setup /home/vagrant/dev_setup
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/groovy64"
  config.vm.hostname = "mitch-dev-setup"
  config.vm.provision "shell", inline: $script
end
