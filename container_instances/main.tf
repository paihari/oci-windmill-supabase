resource "oci_container_instances_container_instance" "windmill_server_instance" {
  compartment_id                       = var.compartment_ocid
  availability_domain                  = var.availability_domain
  display_name                         = "WindmillServer"
  container_restart_policy             = var.container_restart_policy
  graceful_shutdown_timeout_in_seconds = var.graceful_shutdown_timeout_in_seconds
  state                                = var.state


  shape = var.shape
  shape_config {
    memory_in_gbs = var.shape_config.memory_in_gbs
    ocpus         = var.shape_config.ocpus
  }

  containers {
    display_name = "container-1-windmill-server"
    environment_variables = {
      "DATABASE_URL"   = var.database_url
      "RUST_LOG"       = "INFO"
      "NUM_WORKERS"    = "0"
      "DISABLE_SERVER" = "false"
      "METRICS_ADDR"   = "false"
    }
    image_url                      = "ghcr.io/windmill-labs/windmill:v1.402.2"
    is_resource_principal_disabled = "false"
  }

  vnics {

    is_public_ip_assigned  = "true"
    skip_source_dest_check = "true"
    subnet_id              = var.subnet_id
  }
}
