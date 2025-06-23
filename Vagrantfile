# Vagrant.configure("2") do |config|
# 	config.vm.define "dc1" do |dc1|
# 		dc1.vm.box = "jarekole/2022_gui"
# 		dc1.vm.hostname = "dc1"
# 		#dc1.vm.network "private_network", ip: "192.168.33.10"
# 		#dc1.vm.network = "internal_switch"
# 		dc1.vm.synced_folder ".", "/vagrant", disabled: true
# 		dc1.winrm.transport = :plaintext
# 		dc1.winrm.basic_auth_only = true
	  
# 		dc1.vm.provider "hyperv" do |h|
# 		  h.enable_virtualization_extensions = true
# 		  h.linked_clone = true
# 		end
# 		dc1.vm.provision "shell", path: "LCM_Config.ps1", privileged: true
# 		dc1.vm.provision "shell", inline: "Install-Module ActiveDirectoryDsc,Chocolatey,ComputerManagementDsc,xPendingReboot,xStorage,NetworkingDsc,cChoco -Confirm:$false -Force", privileged: true
# 		#dc1.vm.provision "shell", path: "domain.ps1", privileged: true
# 		#dc1.vm.provision "reload"
# 	  end
#   end


Vagrant.configure("2") do |config|
  config.vm.define "ph1" do |ph1|
	  ph1.vm.box = "jarekole/2022_gui"
	  ph1.vm.hostname = "ph1"
	  #ph1.vm.network "private_network", ip: "192.168.33.10"
	  #ph1.vm.network = "internal_switch"
	  ph1.vm.synced_folder ".", "/vagrant", disabled: true
	  ph1.winrm.transport = :plaintext
      ph1.winrm.basic_auth_only = true
	
	  ph1.vm.provider "hyperv" do |h|
		h.enable_virtualization_extensions = true
		h.linked_clone = true
		h.vmname = "ph1"
		h.memory = "512"
		h.maxmemory = "4096"
		h.cpus = 2
	  end
	  ph1.vm.provision "shell", path: "LCM_Config.ps1", privileged: true
	  ph1.vm.provision "shell", inline: "Install-Module cChoco,ComputerManagementDsc,xPendingReboot,SecurityPolicyDsc,NetworkingDsc -Confirm:$false -Force;Set-Item -Path WSMan:\\localhost\\MaxEnvelopeSizeKb -Value 8192", privileged: true
	  ph1.vm.provision "shell", inline: "choco install notepaphlusplus -y", privileged: true 
	  ph1.vm.provision "shell", path: "join-domain.ps1", privileged: true
	  ph1.vm.provision "reload"
	  ph1.vm.provision "shell", path: "ImageConverter.ps1", privileged: true
	  #ph1.vm.provision "shell", path: "app_locker\\event_viewer_collector.ps1", privileged: true
	  #ph1.vm.provision "shell", path: "TSPlus_install_v5.ps1", privileged: true
	  #ph1.vm.provision "shell", path: "TSPlus_install_v5.ps1", privileged: true
	  #ph1.vm.provision "reload"
	end
end

Vagrant.configure("2") do |config|
  config.vm.define "ph2" do |ph2|
	  ph2.vm.box = "jarekole/2022_gui"
	  ph2.vm.hostname = "ph2"
	  #ph2.vm.network "private_network", ip: "192.168.33.10"
	  #ph2.vm.network = "internal_switch"
	  ph2.vm.synced_folder ".", "/vagrant", disabled: true
	  ph2.winrm.transport = :plaintext
      ph2.winrm.basic_auth_only = true
	
	  ph2.vm.provider "hyperv" do |h|
		h.enable_virtualization_extensions = true
		h.linked_clone = true
		h.vmname = "ph2"
		h.memory = "512"
		h.maxmemory = "4096"
		h.cpus = 2
	  end
	  ph2.vm.provision "shell", path: "LCM_Config.ps1", privileged: true
	  ph2.vm.provision "shell", inline: "Install-Module xRobocopy,cChoco,ComputerManagementDsc,xPendingReboot,NetworkingDsc -Confirm:$false -Force;Set-Item -Path WSMan:\\localhost\\MaxEnvelopeSizeKb -Value 8192", privileged: true
	  ph2.vm.provision "shell", inline: "choco install notepaphlusplus -y", privileged: true
	  ph2.vm.provision "shell", path: "join-domain.ps1", privileged: true
	  #ph2.vm.provision "shell", path: "Download_tsplus.ps1", privileged: true
	  #ph2.vm.provision "shell", path: "TSPlus_install_v3.ps1", privileged: true
	  #ph2.vm.provision "reload"
	end
end

Vagrant.configure("2") do |config|
  config.vm.define "ph3" do |ph3|
	  ph3.vm.box = "jarekole/2022_gui"
	  ph3.vm.hostname = "ph3"
	  
	  #ph3.vm.network "private_network", ip: "192.168.33.10"
	  #ph3.vm.network = "internal_switch"
	  ph3.vm.synced_folder ".", "/vagrant", disabled: true
	  ph3.winrm.transport = :plaintext
      ph3.winrm.basic_auth_only = true
	
	  ph3.vm.provider "hyperv" do |h|
		h.enable_virtualization_extensions = true
		h.linked_clone = true
		h.vmname = "ph3"
		h.memory = "512"
		h.maxmemory = "4096"
		h.cpus = 2
	  end
	  ph3.vm.provision "shell", path: "LCM_Config.ps1", privileged: true
	  ph3.vm.provision "shell", inline: "Install-Module cChoco,ComputerManagementDsc,xPendingReboot,NetworkingDsc -Confirm:$false -Force;Set-Item -Path WSMan:\\localhost\\MaxEnvelopeSizeKb -Value 8192", privileged: true
	  ph3.vm.provision "shell", path: "join-domain.ps1", privileged: true
	  #ph3.vm.provision "shell", path: "TSPlus_install_v4.ps1", privileged: true
	  #ph3.vm.provision "shell", path: "TSPlus_install_v4.ps1", privileged: true
	  
	  
	  #ph3.vm.provision "reload"
	end
end


Vagrant.configure("2") do |config|
	config.vm.define "ph4" do |ph4|
		ph4.vm.box = "jarekole/2022_gui"
		ph4.vm.hostname = "ph4"
		
		#ph4.vm.network "private_network", ip: "192.168.33.10"
		#ph4.vm.network = "internal_switch"
		ph4.vm.synced_folder ".", "/vagrant", disabled: true
		ph4.winrm.transport = :plaintext
		ph4.winrm.basic_auth_only = true
	  
		ph4.vm.provider "hyperv" do |h|
		  h.enable_virtualization_extensions = true
		  h.linked_clone = true
		  h.vmname = "Lars_ph4"
		  h.memory = "512"
		  h.maxmemory = "4096"
		  h.cpus = 2
		end
		ph4.vm.provision "shell", path: "LCM_Config.ps1", privileged: true
		ph4.vm.provision "shell", inline: "Install-Module xRobocopy,cChoco,ComputerManagementDsc,xPendingReboot,NetworkingDsc -Confirm:$false -Force;Set-Item -Path WSMan:\\localhost\\MaxEnvelopeSizeKb -Value 8192", privileged: true
		ph4.vm.provision "shell", inline: "choco install notepaphlusplus -y", privileged: true 
		ph4.vm.provision "shell", path: "join-domain.ps1", privileged: true
		#ph4.vm.provision "shell", path: "TSPlus_install_v4.ps1", privileged: true
		#ph4.vm.provision "shell", path: "TSPlus_install_v4.ps1", privileged: true
		#ph4.vm.provision "shell", path: "TSPlus_install_v4.ps1", privileged: true
		
		#ph4.vm.provision "reload"
	end
end


Vagrant.configure("2") do |config|
	config.vm.define "ph5" do |ph5|
		ph5.vm.box = "jarekole/2022_gui"
		ph5.vm.hostname = "ph5"
		
		#ph5.vm.network "private_network", ip: "192.168.33.10"
		#ph5.vm.network = "internal_switch"
		ph5.vm.synced_folder ".", "/vagrant", disabled: true
		ph5.winrm.transport = :plaintext
		ph5.winrm.basic_auth_only = true
	  
		ph5.vm.provider "hyperv" do |h|
		  h.enable_virtualization_extensions = true
		  h.linked_clone = true
		  h.vmname = "ph5"
		  h.memory = "4096"
		  h.maxmemory = "4096"
		  h.cpus = 2
		end
		ph5.vm.provision "shell", path: "LCM_Config.ps1", privileged: true
	  	ph5.vm.provision "shell", inline: "Install-Module xRobocopy,cChoco,ComputerManagementDsc,xPendingReboot,NetworkingDsc -Confirm:$false -Force;Set-Item -Path WSMan:\\localhost\\MaxEnvelopeSizeKb -Value 8192", privileged: true
		#ph5.vm.provision "shell", path: "set-localDNSServer.ps1", privileged: true
		ph5.vm.provision "shell", path: "join-domain.ps1", privileged: true
		#ph5.vm.provision "shell", path: "TSPlusBasic.ps1", privileged: true
		#ph5.vm.provision "shell", path: "TSPlus_install_v5.ps1", privileged: true
		#ph5.vm.provision "shell", path: "TSPlus_install_v5.ps1", privileged: true
		#ph1.vm.provision "reload"
		
		#ph5.vm.provision "reload"
	end
end




Vagrant.configure("2") do |config|
	config.vm.define "ph6" do |ph6|
		ph6.vm.box = "generic/ubuntu2204"
		ph6.vm.hostname = "ph6"
		
		#ph6.vm.network "private_network", ip: "192.168.33.10"
		#ph6.vm.network = "internal_switch"
		ph6.vm.synced_folder ".", "/vagrant", disabled: true
		ph6.winrm.transport = :plaintext
		ph6.winrm.basic_auth_only = true
	  
		ph6.vm.provider "hyperv" do |h|
		  h.enable_virtualization_extensions = true
		  h.linked_clone = true
		  h.vmname = "ph6"
		  h.memory = "8192"
		  h.maxmemory = "8192"
		  h.cpus = 2
		end
		ph6.vm.provision "shell", path: "docker_install.bash", privileged: true
		ph6.vm.provision "shell", path: "docker_portainer.bash", privileged: true
		ph6.vm.provision "shell", path: "azcli_install.bash", privileged: true
	  	#ph6.vm.provision "shell", inline: "Install-Module xRobocopy,cChoco,ComputerManagementDsc,xPendingReboot,NetworkingDsc -Confirm:$false -Force;Set-Item -Path WSMan:\\localhost\\MaxEnvelopeSizeKb -Value 8192", privileged: true
		#ph6.vm.provision "shell", path: "set-localDNSServer.ps1", privileged: true
		#ph6.vm.provision "shell", path: "join-domain.ps1", privileged: true
		#ph6.vm.provision "shell", path: "TSPlusBasic.ps1", privileged: true
		#ph6.vm.provision "shell", path: "TSPlus_install_v3.ps1", privileged: true
		#ph6.vm.provision "shell", path: "TSPlus_install_v3.ps1", privileged: true
		#ph1.vm.provision "reload"
		
		#ph6.vm.provision "reload"
	end
end


Vagrant.configure("2") do |config|
	config.vm.define "ph7" do |ph7|
		ph7.vm.box = "generic/ubuntu2204"
		ph7.vm.hostname = "ph7"
		
		#ph7.vm.network "private_network", ip: "192.168.33.10"
		#ph7.vm.network = "internal_switch"
		ph7.vm.synced_folder ".", "/vagrant", disabled: true
		ph7.winrm.transport = :plaintext
		ph7.winrm.basic_auth_only = true
	  
		ph7.vm.provider "hyperv" do |h|
		  h.enable_virtualization_extensions = true
		  h.linked_clone = true
		  h.vmname = "ph7"
		  h.memory = "8192"
		  h.maxmemory = "8192"
		  h.cpus = 2
		end
		#ph7.vm.provision "shell", path: "LCM_Config.ps1", privileged: true
	  	#ph7.vm.provision "shell", inline: "Install-Module xRobocopy,cChoco,ComputerManagementDsc,xPendingReboot,NetworkingDsc -Confirm:$false -Force;Set-Item -Path WSMan:\\localhost\\MaxEnvelopeSizeKb -Value 8192", privileged: true
		#ph7.vm.provision "shell", path: "set-localDNSServer.ps1", privileged: true
		#ph7.vm.provision "shell", path: "join-domain.ps1", privileged: true
		#ph7.vm.provision "shell", path: "TSPlusBasic.ps1", privileged: true
		#ph7.vm.provision "shell", path: "TSPlus_install_v3.ps1", privileged: true
		#ph7.vm.provision "shell", path: "TSPlus_install_v3.ps1", privileged: true
		#ph1.vm.provision "reload"
		
		#ph7.vm.provision "reload"
	end
end


Vagrant.configure("2") do |config|
	config.vm.define "ph8" do |ph8|
		ph8.vm.box = "generic/ubuntu2204"
		ph8.vm.hostname = "ph8"
		ph8.vm.synced_folder ".", "/vagrant", disabled: true
		ph8.winrm.transport = :plaintext
		ph8.winrm.basic_auth_only = true
	  
		ph8.vm.provider "hyperv" do |h|
		  h.enable_virtualization_extensions = true
		  h.linked_clone = true
		  h.vmname = "ph8"
		  h.memory = "8192"
		  h.maxmemory = "8192"
		  h.cpus = 2
		end
		ph8.vm.provision "shell", path: "azcli_install.bash", privileged: true
		ph8.vm.provision "shell", path: "docker_install.bash", privileged: true
		ph8.vm.provision "shell", path: "docker_portainer.bash", privileged: true
		ph8.vm.provision "shell", path: "docker_airflow.bash", privileged: true
		
		#ph8.vm.provision "shell", path: "LCM_Config.ps1", privileged: true
	  	#ph8.vm.provision "reload"
	end
end

Vagrant.configure("2") do |config|
	config.vm.define "vm01" do |vm01|
		vm01.vm.box = "generic/ubuntu2204"
		vm01.vm.hostname = "vm01"
		
		#vm01.vm.network "private_network", ip: "192.168.33.10"
		#vm01.vm.network = "internal_switch"
		vm01.vm.synced_folder ".", "/vagrant", disabled: true
		vm01.winrm.transport = :plaintext
		vm01.winrm.basic_auth_only = true
	  
		vm01.vm.provider "hyperv" do |h|
		  h.enable_virtualization_extensions = true
		  h.linked_clone = true
		  h.vmname = "vm01"
		  h.memory = "8192"
		  h.maxmemory = "8192"
		  h.cpus = 2
		end
		vm01.vm.provision "shell", path: "azcli_install.bash", privileged: true
		vm01.vm.provision "shell", path: "docker_install.bash", privileged: true
		vm01.vm.provision "file", source: "docker-compose-local.yml", destination: "/home/vagrant/docker-compose-local.yml"
		vm01.vm.provision "shell", path: "datahub_prereq.bash", privileged: true
		vm01.vm.provision "shell", path: "datahub_install.bash", privileged: false
		#vm01.vm.provision "shell", path: "LCM_Config.ps1", privileged: true
	  	#vm01.vm.provision "shell", inline: "Install-Module xRobocopy,cChoco,ComputerManagementDsc,xPendingReboot,NetworkingDsc -Confirm:$false -Force;Set-Item -Path WSMan:\\localhost\\MaxEnvelopeSizeKb -Value 8192", privileged: true
		#vm01.vm.provision "shell", path: "set-localDNSServer.ps1", privileged: true
		#vm01.vm.provision "shell", path: "join-domain.ps1", privileged: true
		#vm01.vm.provision "shell", path: "TSPlusBasic.ps1", privileged: true
		#vm01.vm.provision "shell", path: "TSPlus_install_v3.ps1", privileged: true
		#vm01.vm.provision "shell", path: "TSPlus_install_v3.ps1", privileged: true
		#ph1.vm.provision "reload"
		
		#vm01.vm.provision "reload"
	end
end