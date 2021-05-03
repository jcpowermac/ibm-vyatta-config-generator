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
