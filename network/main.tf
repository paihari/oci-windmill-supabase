resource "oci_core_virtual_network" "windmill_vcn" {

  cidr_block     = var.windmill_vcn_cidr
  compartment_id = var.compartment_ocid
  display_name   = "WindmillVCN"
  dns_label      = "windmillvcn"

}

resource "oci_core_internet_gateway" "windmill_igw" {
  compartment_id = var.compartment_ocid
  display_name   = "WindmillIGW"
  vcn_id         = oci_core_virtual_network.windmill_vcn.id

}

resource "oci_core_route_table" "windmill_rt" {

  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.windmill_vcn.id
  display_name   = "WindmillRouteTable"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.windmill_igw.id
  }

}

resource "oci_core_security_list" "windmill_securitylist" {

  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.windmill_vcn.id
  display_name   = "WindmillSecurityList"

  egress_security_rules {
    protocol    = "6"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = "22"
      min = "22"
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = "8000"
      min = "8000"
    }
  }
}

resource "oci_core_subnet" "windmill_subnet" {
  cidr_block                 = var.windmill_subnet_cidr
  display_name               = "WindmillSubnet"
  dns_label                  = "windmillsubnet"
  compartment_id             = var.compartment_ocid
  vcn_id                     = oci_core_virtual_network.windmill_vcn.id
  route_table_id             = oci_core_route_table.windmill_rt.id
  security_list_ids          = [oci_core_security_list.windmill_securitylist.id]
  prohibit_public_ip_on_vnic = false

}

