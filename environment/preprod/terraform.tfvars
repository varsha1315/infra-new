rgs = {
  rg1 = {
    name     = "RG-DEV1"
    location = "Central India"
  }

}

vnet = {
  vnet1 = {
    name                = "VNET-DEV"
    location            = "Central India"
    resource_group_name = "RG-DEV1"
    address_space       = ["10.0.0.0/16"]

  }
}

subnet = {
  subnet1 = {
    name                 = "subnet-DEV"
    location             = "Central India"
    resource_group_name  = "RG-DEV1"
    virtual_network_name = "VNET-DEV"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "subnet-DEV2"
    location             = "Central India"
    resource_group_name  = "RG-DEV1"
    virtual_network_name = "VNET-DEV"
    address_prefixes     = ["10.0.2.0/24"]
  }
}
public_ip = {
  public_ip1 = {
    name                = "public-ip-DEV"
    location            = "Central India"
    resource_group_name = "RG-DEV1"
    allocation_method   = "Static"
  }
  public_ip2 = {
    name                = "public-ip-DEV2"
    location            = "Central India"
    resource_group_name = "RG-DEV1"
    allocation_method   = "Static"
  }
}
vms = {
  vm1 = {
    nic_name            = "nic-DEV"
    vm_name             = "vm-DEV"
    location            = "Central India"
    resource_group_name = "RG-DEV1"
    nic_subnet_name     = "subnet-DEV"
    nic_public_ip_name  = "public-ip-DEV"
    vm_size             = "Standard_D2s_v3"
    admin_username      = "adminuser"
    admin_password      = "Yuvika2022!@!"
    image_publisher     = "Canonical"
    image_offer         = "UbuntuServer"
    image_sku           = "18.04-LTS"
    image_version       = "latest"
  }
  vm2 = {
    nic_name            = "nic-DEV2"
    vm_name             = "vm-DEV2"
    location            = "Central India"
    resource_group_name = "RG-DEV1"
    nic_subnet_name     = "subnet-DEV"
    nic_public_ip_name  = "public-ip-DEV2"
    vm_size             = "Standard_D2s_v3"
    admin_username      = "adminuser"
    admin_password      = "Yuvika2022!@!"
    image_publisher     = "Canonical"
    image_offer         = "UbuntuServer"
    image_sku           = "18.04-LTS"
    image_version       = "latest"
  }
}
