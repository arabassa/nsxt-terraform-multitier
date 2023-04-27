terraform {
  required_providers {
    nsxt = {
      source = "vmware/nsxt"
    }
  }
}

variable vmc_token{}
  
provider "nsxt" {
  host                 = "https://nsx-99-99-99-299.rp.vmwarevmc.com/vmc/reverse-proxy/api/orgs/myOrgId/sddcs/mySddcId/sks-nsxt-manager"
  vmc_token            = var.vmc_token
  allow_unverified_ssl = true
  enforcement_point    = "vmc-enforcementpoint"
}