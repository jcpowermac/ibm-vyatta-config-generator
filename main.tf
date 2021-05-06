locals {
  vrrp_vlan_configs = { for idx, vlan in var.vlans :
    idx => {
      vlan                 = var.vlans[idx]
      primary_ip_address   = format("%s/%s", cidrhost("${var.vlan_prefixes[idx]}/${var.vlan_mask}", 1), var.vlan_mask)
      secondary_ip_address = format("%s/%s", cidrhost("${var.vlan_prefixes[idx]}/${var.vlan_mask}", 2), var.vlan_mask)
    }
  }
}

provider "ibm" {
  ibmcloud_api_key      = var.ibmcloud_api_key
  iaas_classic_username = var.iaas_classic_username
  iaas_classic_api_key  = var.iaas_classic_api_key
}

module "vyatta" {
  source            = "./vyatta"
  vrrp_vlan_configs = local.vrrp_vlan_configs
  vlan_name         = var.vlan_name
}
