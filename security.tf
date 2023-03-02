resource "nsxt_policy_security_policy" "admin_policy1" {
  display_name = "admin_policy1"
  description  = "Terraform provisioned Security Policy"
  category     = "Application"
  locked       = false
  stateful     = true
  tcp_strict   = false
  domain       = "cgw"

  rule {
    display_name       = "block_incoming_icmp"
    source_groups      = [nsxt_policy_group.acc_group.path, nsxt_policy_group.fin_group.path]
    destination_groups = [nsxt_policy_group.admin_group.path]
    action             = "DROP"
    services           = [data.nsxt_policy_service.icmp.path]
    logged             = true
  }
}

resource "nsxt_policy_security_policy" "acc_policy1" {
  display_name = "accounting_policy1"
  description  = "Terraform provisioned Security Policy"
  category     = "Application"
  locked       = false
  stateful     = true
  tcp_strict   = false
  domain       = "cgw"

  rule {
    display_name       = "drop finance networks"
    source_groups      = [nsxt_policy_group.fin_group.path]
    destination_groups = [nsxt_policy_group.acc_group.path]
    action             = "DROP"
    services           = [data.nsxt_policy_service.icmp.path]
    logged             = true
  }
}

resource "nsxt_policy_security_policy" "fin_policy1" {
  display_name = "finance_policy1"
  description  = "Terraform provisioned Security Policy"
  category     = "Application"
  locked       = false
  stateful     = true
  tcp_strict   = false
  domain       = "cgw"

  rule {
    display_name       = "allow admin and accounting networks"
    source_groups      = [nsxt_policy_group.acc_group.path, nsxt_policy_group.admin_group.path]
    destination_groups = [nsxt_policy_group.fin_group.path]
    action             = "ALLOW"
    services           = []
    logged             = true
  }
    rule {
    display_name       = "deny all outgoing traffic"
    source_groups      = [nsxt_policy_group.fin_group.path]
    destination_groups = []
    action             = "ALLOW"
    services           = []
    logged             = true
  }
}