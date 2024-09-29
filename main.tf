# module "network" {
#   source                 = "./network"
#   compartment_ocid       = var.compartment_ocid
#   windmill_vcn_cidr      = var.windmill_vcn_cidr
#   windmill_subnet_cidr   = var.windmill_subnet_cidr

# }

module "container_instances" {
  source           = "./container_instances"
  compartment_ocid = var.compartment_ocid
  subnet_id        = var.windmill_subnet_id
  database_url     = var.database_url
}





