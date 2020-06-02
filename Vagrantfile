$script = <<-SCRIPT
mkdir -p /home/vagrant/git/dev_setup
cd /home/vagrant/git; git clone https://github.com/mitchdz/dev_setup
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.provision "shell", inline: $script
end
