resource "nsxt_policy_nat_rule" "admin_nat" {
  display_name         = "admin_dnat_rule1"
  action               = "DNAT"
  source_networks      = []
  destination_networks = ["192.168.250.100"]
  translated_networks  = ["192.168.150.100"]
  gateway_path         = data.nsxt_policy_tier1_gateway.t1_gw_admin.path
  logging              = false
  firewall_match       = "BYPASS"

  tag {
    scope = "tier"
    tag   = "admin"
  }
}

resource "nsxt_policy_security_policy" "admin_policy2" {
  display_name = "admin_policy2"
  description  = "Terraform provisioned Security Policy"
  category     = "Application"
  locked       = false
  stateful     = true
  tcp_strict   = false
  domain       = "cgw"

  rule {
    display_name       = "allow_incoming_icmp"
    source_groups      = [nsxt_policy_group.acc_group.path]
    destination_groups = [nsxt_policy_group.admin_group.path]
    action             = "ALLOW"
    services           = [data.nsxt_policy_service.icmp.path]
    logged             = true
  }
}