data "ibm_network_vlan" "vlan_ocp_ci" {
  for_each = toset(var.vlans)
  number   = each.value
  name     = var.vlan_name
}

resource "local_file" "vyatta_tmpl" {
  for_each = toset(var.vlans)

  content = templatefile(
    "${path.module}/vyatta.tmpl", {
      vlan    = each.value,
      subnets = data.ibm_network_vlan.vlan_ocp_ci[each.value].subnets
  })

  filename = "${path.module}/${each.value}.txt"
}

