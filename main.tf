provider "ibm" {
  ibmcloud_api_key      = var.ibmcloud_api_key
  iaas_classic_username = var.iaas_classic_username
  iaas_classic_api_key  = var.iaas_classic_api_key
}

module "vyatta" {
  source    = "./vyatta"
  vlans     = var.vlans
  vlan_name = var.vlan_name
}
