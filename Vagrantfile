Vagrant.configure("2") do |config|
    config.vm.define "k3s-master" do |master|
      master.vm.box = "ubuntu/focal64"
      master.vm.network "private_network", ip: "192.168.56.11"
      master.vm.synced_folder "./k3s_conf", "/vagrant"
      master.vm.provider "virtualbox" do |vb|
        vb.memory = "4048"
        vb.cpus = "4"
      end
    end
    config.vm.provision "shell", run: "once", path: "./k3s_conf/setup.sh"   # run in first time (or with --provision flag)
    config.vm.provision "shell", run: "always", path: "./k3s_conf/deploy.sh"
  end