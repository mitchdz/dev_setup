$script = <<-SCRIPT
mkdir -p /home/vagrant/git/
git clone https://github.com/mitchdz/dev_setup -b mitch/dev /home/vagrant/git/dev_setup
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-20.04"
  config.vm.hostname = "mitch-dev-setup"
  config.vm.provision "shell", inline: $script
end
