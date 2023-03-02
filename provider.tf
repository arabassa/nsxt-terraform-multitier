terraform {
  required_providers {
    nsxt = {
      source = "vmware/nsxt"
    }
  }
}

provider "nsxt" {
  host                 = "your nsx reverse proxy path"
  vmc_token            = "your API access token"
  allow_unverified_ssl = true
  enforcement_point    = "vmc-enforcementpoint"
}