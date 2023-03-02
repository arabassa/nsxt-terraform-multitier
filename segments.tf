resource "nsxt_policy_segment" "acc_segment1" {
  display_name        = "accounting_segment_1"
  description         = "Terraform provisioned Segment"
  connectivity_path   = data.nsxt_policy_tier1_gateway.t1_gw_accounting.path
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path

  subnet {
    cidr        = "172.19.80.1/24"
    dhcp_ranges = ["172.19.80.100-172.19.80.160"]

    dhcp_v4_config {
      server_address = "172.19.80.2/24"
      lease_time     = 36000
    }
  }

 tag {
    scope = "tier"
    tag   = "accounting"
  }
}

resource "nsxt_policy_segment" "acc_segment2" {
  display_name        = "accounting_segment_2"
  description         = "Terraform provisioned Segment"
  connectivity_path   = data.nsxt_policy_tier1_gateway.t1_gw_accounting.path
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path

  subnet {
    cidr        = "172.19.90.1/24"
    dhcp_ranges = ["172.19.90.100-172.19.90.160"]

    dhcp_v4_config {
      server_address = "172.19.90.2/24"
      lease_time     = 36000
    }
  }

 tag {
    scope = "tier"
    tag   = "accounting"
  }
}

resource "nsxt_policy_segment" "fin_segment1" {
  display_name        = "finance_segment_1"
  description         = "Terraform provisioned Segment"
  connectivity_path   = data.nsxt_policy_tier1_gateway.t1_gw_finance.path
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path

  subnet {
    cidr        = "172.19.110.1/24"
    dhcp_ranges = ["172.19.110.100-172.19.110.160"]

    dhcp_v4_config {
      server_address = "172.19.110.2/24"
      lease_time     = 36000
    }
  }

 tag {
    scope = "tier"
    tag   = "finance"
  }
}

resource "nsxt_policy_segment" "admin_segment1" {
  display_name        = "admin_segment_1"
  description         = "Terraform provisioned Segment"
  connectivity_path   = data.nsxt_policy_tier1_gateway.t1_gw_admin.path
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path

  subnet {
    cidr        = "192.168.150.1/24"
    dhcp_ranges = ["192.168.150.100-192.168.150.150"]

    dhcp_v4_config {
      server_address = "192.168.150.2/24"
      lease_time     = 36000
    }
  }

 tag {
    scope = "tier"
    tag   = "admin"
  }
}