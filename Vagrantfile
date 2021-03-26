Vagrant.configure('2') do |config|
  config.vm.box = 'debian/buster64'
  config.vm.box_check_update = true

  if Vagrant.has_plugin?('vagrant-vbguest')
    config.vbguest.auto_update = false
  end

  config.vm.network 'private_network', ip: '192.168.99.12'

  config.vm.provider 'virtualbox' do |vb|
    vb.name = 'POST'
    vb.memory = 4096
    vb.cpus = 2
    vb.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
    vb.customize ['modifyvm', :id, '--audio', 'none']
  end

  # Forwarded port mapping:
  config.vm.network 'forwarded_port', guest: 8006, host: 8006

  # Ensure Workspace sync
  config.vm.synced_folder '.', '/vagrant',
    mount_options: ['dmode=751,fmode=600']

  # Ansible provision
  config.vm.provision :ansible_local do |ansible|
    ansible.verbose = true
    ansible.become = true
    ansible.install = true
    ansible.playbook = 'ansible/main.yaml'
  end
  
end