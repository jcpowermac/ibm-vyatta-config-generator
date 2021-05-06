variable "ibmcloud_api_key" {
  type      = string
  sensitive = true
}

variable "iaas_classic_username" {
  type      = string
  sensitive = true
}

variable "iaas_classic_api_key" {
  type      = string
  sensitive = true
}

variable "vlans" {
  type = list(any)
}


variable "vlan_prefixes" {
  type = list(any)
}

variable "vlan_mask" {
  type    = number
  default = 30
}


//variable "vlan_ip_addresses" {
//  type = list(any)
//}

variable "vlan_name" {
  type = string
}
