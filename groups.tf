resource "nsxt_policy_group" "acc_group" {
  display_name = "accounting-group"
  description  = "Terraform provisioned accounting Group"
  domain       = "cgw"


  criteria {
    condition {
      key         = "Tag"
      member_type = "Segment"
      operator    = "EQUALS"
      value       = "accounting"
    }
  }
  }

resource "nsxt_policy_group" "fin_group" {
  display_name = "finance-group"
  description  = "Terraform provisioned finance Group"
  domain       = "cgw"


  criteria {
    condition {
      key         = "Tag"
      member_type = "Segment"
      operator    = "EQUALS"
      value       = "finance"
    }
  }
  }

  resource "nsxt_policy_group" "admin_group" {
  display_name = "admin-group"
  description  = "Terraform provisioned admin Group"
  domain       = "cgw"


  criteria {
    condition {
      key         = "Tag"
      member_type = "Segment"
      operator    = "EQUALS"
      value       = "admin"
    }
  }
  }