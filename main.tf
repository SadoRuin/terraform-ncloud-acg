################################################################################
# ACG
################################################################################

locals {
  acgs = {
    for x in var.acgs :
    x.name => x
  }
}

resource "ncloud_access_control_group" "this" {
  for_each    = local.acgs
  name        = each.value.name
  vpc_no      = each.value.vpc_id
  description = each.value.description
}

resource "ncloud_access_control_group_rule" "this" {
  for_each = {
    for k, v in local.acgs :
    k => v if length(var.inbound_rules[k]) + length(var.outbound_rules[k]) > 0
  }

  access_control_group_no = ncloud_access_control_group.this[each.value.name].id

  dynamic "inbound" {
    for_each = var.inbound_rules[each.value.name]

    content {
      protocol    = inbound.value.protocol
      ip_block    = inbound.value.ip_block
      port_range  = inbound.value.port_range
      description = inbound.value.description
    }
  }

  dynamic "outbound" {
    for_each = var.outbound_rules[each.value.name]

    content {
      protocol    = outbound.value.protocol
      ip_block    = outbound.value.ip_block
      port_range  = outbound.value.port_range
      description = outbound.value.description
    }
  }
}
