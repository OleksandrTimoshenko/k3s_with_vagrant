Vagrant.configure("2") do |config|
    config.vm.define "k3s-master" do |master|
      master.vm.box = "ubuntu/focal64"
      master.vm.network "private_network", ip: "192.168.56.11"
      master.vm.synced_folder "./k3s_conf", "/vagrant/k3s_conf", create: true
      master.vm.synced_folder "./django", "/vagrant/django", create: true
      master.vm.synced_folder "./nginx", "/vagrant/nginx", create: true
      master.vm.provision "file", source: "github.env", destination: "github.env"
      master.vm.provision "file", source: "registries.yaml", destination: "registries.yaml"
      master.vm.provider "virtualbox" do |vb|
        vb.memory = "4048"
        vb.cpus = "4"
      end
    end
    config.vm.provision "shell", run: "once",   path: "./k3s_conf/setup.sh"   # run in first time (or with --provision flag)
    config.vm.provision "shell", run: "once",   path: "./k3s_conf/push.sh"
    config.vm.provision "shell", run: "always", path: "./k3s_conf/deploy.sh"
  end