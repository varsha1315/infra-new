

module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_vnet"
  vnet       = var.vnet
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../modules/azurerm_subnet"
  subnet     = var.subnet
}

module "azurerm_public_ip" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_public_ip"
  public_ip  = var.public_ip
}

module "vm" {
  depends_on = [module.azurerm_public_ip, module.subnet]
  source     = "../../modules/azurerm_virtual_machine"
  vms        = var.vms
}
