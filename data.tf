data "nsxt_policy_transport_zone" "overlay_tz" {
  display_name = "vmc-overlay-tz"
}

data "nsxt_policy_tier1_gateway" "t1_gw_accounting" {
  display_name              = "TF_Accounting_T1"
}

data "nsxt_policy_tier1_gateway" "t1_gw_finance" {
  display_name              = "TF_Finance_T1"
}

data "nsxt_policy_tier1_gateway" "t1_gw_admin" {
  display_name              = "TF_Admin_T1"
}

data "nsxt_policy_service" "icmp" {
  display_name = "ICMP ALL"
}