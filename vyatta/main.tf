data "ibm_network_vlan" "vlan_ocp_ci" {
  for_each = toset(var.vlans)
  number   = each.value
}


// template

