## Copyright (c) 2022 Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# terraform {
#   required_providers {
#     oci = {
#       source  = "oracle/oci"
#     }
#   }
# }


terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 5.14.0"
    }
  }

}
# provider "oci" {
#   tenancy_ocid     = var.tenancy_ocid
#   user_ocid        = var.user_ocid
#   fingerprint      = var.fingerprint
#   private_key_path = var.private_key_path
#   region           = var.region
# }

provider "oci" {
  region           = var.region
}


 