Vagrant.configure("2") do |config|
    config.vm.define "k3s-master" do |master|
      master.vm.box = "ubuntu/focal64"
      master.vm.network "private_network", ip: "192.168.56.11"
      master.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
        vb.cpus = "2"
      end
    end
  
    config.vm.define "k3s-worker" do |worker|
      worker.vm.box = "ubuntu/focal64"
      worker.vm.network "private_network", ip: "192.168.56.12"
      worker.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
        vb.cpus = "2"
      end
    end
  end