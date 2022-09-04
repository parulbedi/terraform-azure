# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "2.66.0"
#     }
#   }
# }

# provider "azurerm" {
#   features {}
# }

# # Create resource group
# resource "azurerm_resource_group" "rg-mygroup" {
#   name     = "rg-mygroup"
#   location = "East US"
# }

# # Create virtual network
# resource "azurerm_virtual_network" "vnet-mynetwork" {
#   name                = "vnet-mynetwork"
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.rg-mygroup.location
#   resource_group_name = azurerm_resource_group.rg-mygroup.name
# }

# # Create subnet
# resource "azurerm_subnet" "sub-mysubnet" {
#   name                 = "sub-mysubnet"
#   resource_group_name  = azurerm_resource_group.rg-mygroup.name
#   virtual_network_name = azurerm_virtual_network.vnet-mynetwork.name
#   address_prefixes     = ["10.0.2.0/24"]
# }

# # Create public IPs
# resource "azurerm_public_ip" "ip-mypublic" {
#   count               = 2
#   name                = "ip-mypublic-${count.index}"
#   location            = azurerm_resource_group.rg-mygroup.location
#   resource_group_name = azurerm_resource_group.rg-mygroup.name
#   allocation_method   = "Static"
#   #  allocation_method            = "Dynamic"

# }

# #  resource "azurerm_lb" "test" {
# #    name                = "loadBalancer"
# #    location            = azurerm_resource_group.test.location
# #    resource_group_name = azurerm_resource_group.test.name

# #    frontend_ip_configuration {
# #      name                 = "publicIPAddress"
# #      public_ip_address_id = azurerm_public_ip.test.id
# #    }
# #  }

# #  resource "azurerm_lb_backend_address_pool" "test" {
# #    loadbalancer_id     = azurerm_lb.test.id
# #    name                = "BackEndAddressPool"
# #  }


# # Create network interface
# resource "azurerm_network_interface" "nic-myinterface" {
#   count               = 2
#   name                = "nic-myinterface-${count.index}"
#   location            = azurerm_resource_group.rg-mygroup.location
#   resource_group_name = azurerm_resource_group.rg-mygroup.name

#   ip_configuration {
#     name                          = "nic-configuration"
#     subnet_id                     = azurerm_subnet.sub-mysubnet.id
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id          = azurerm_public_ip.ip-mypublic[count.index].id
#     # public_ip_address_id         = azurerm_public_ip.ip-mypublic[count.index]
#     # public_ip_address_id         = count.index == 1  ? azurerm_public_ip.ip-mypublic.id : null
#     # public_ip_address_id         = "${azurerm_public_ip.ip-mypublic.*.id[count.index]}" 
#     # public_ip_address_allocation = "Dynamic"
#     # public_ip_address_id         = azurerm_public_ip.ip-mypublic
#   }
# }


# #  resource "azurerm_managed_disk" "test" {
# #    count                = 2
# #    name                 = "datadisk_existing_${count.index}"
# #    location             = azurerm_resource_group.test.location
# #    resource_group_name  = azurerm_resource_group.test.name
# #    storage_account_type = "Standard_LRS"
# #    create_option        = "Empty"
# #    disk_size_gb         = "1023"
# #  }

# #  resource "azurerm_availability_set" "avset" {
# #    name                         = "avset"
# #    location                     = azurerm_resource_group.test.location
# #    resource_group_name          = azurerm_resource_group.test.name
# #    platform_fault_domain_count  = 2
# #    platform_update_domain_count = 2
# #    managed                      = true
# #  }


# # Create virtual machine
# resource "azurerm_virtual_machine" "my-virtualmachine" {
#   count    = 2
#   name     = "my-virtualmachine-${count.index}"
#   location = azurerm_resource_group.rg-mygroup.location
#   #  availability_set_id   = azurerm_availability_set.avset.id
#   resource_group_name   = azurerm_resource_group.rg-mygroup.name
#   network_interface_ids = [element(azurerm_network_interface.nic-myinterface.*.id, count.index)]
#   vm_size               = "Standard_B1s"

#   # Uncomment this line to delete the OS disk automatically when deleting the VM
#   # delete_os_disk_on_termination = true

#   # Uncomment this line to delete the data disks automatically when deleting the VM
#   # delete_data_disks_on_termination = true


#   # Selecting OS Image
#   storage_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-focal"
#     sku       = "20_04-lts-gen2"
#     version   = "latest"
#   }


#   # Selecting OS Disk Type
#   storage_os_disk {
#     name              = "my-osdisk-${count.index}"
#     caching           = "ReadWrite"
#     create_option     = "FromImage"
#     managed_disk_type = "Standard_LRS"
#   }

#   #  # Optional data disks
#   #  storage_data_disk {
#   #    name              = "datadisk_new_${count.index}"
#   #    managed_disk_type = "Standard_LRS"
#   #    create_option     = "Empty"
#   #    lun               = 0
#   #    disk_size_gb      = "1023"
#   #  }

#   #  storage_data_disk {
#   #    name            = element(azurerm_managed_disk.test.*.name, count.index)
#   #    managed_disk_id = element(azurerm_managed_disk.test.*.id, count.index)
#   #    create_option   = "Attach"
#   #    lun             = 1
#   #    disk_size_gb    = element(azurerm_managed_disk.test.*.disk_size_gb, count.index)
#   #  }

#   # Adding UserName & Password
#   os_profile {
#     computer_name  = "my-virtualmachine"
#     admin_username = "ubuntu"
#     admin_password = "ubuntu@123"
#   }

#   os_profile_linux_config {
#     disable_password_authentication = false
#   }

#   #  tags = {
#   #    environment = "staging"
#   #  }
# }