data "ibm_network_vlan" "vlan_ocp_ci" {
  for_each = var.vrrp_vlan_configs
  number   = each.value.vlan
  name     = var.vlan_name
}

resource "local_file" "vyatta_tmpl" {
  for_each = var.vrrp_vlan_configs

  content = templatefile(
    "${path.module}/vyatta.tmpl", {
      vlan                 = each.value.vlan,
      subnets              = data.ibm_network_vlan.vlan_ocp_ci[each.key].subnets
      primary_ip_address   = format("'%s'", each.value.primary_ip_address)
      secondary_ip_address = format("'%s'", each.value.secondary_ip_address)
  })

  filename = "${path.module}/${each.value.vlan}.txt"
}

