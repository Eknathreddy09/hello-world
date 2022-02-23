resource "tanzu-mission-control_cluster" "create_tkgs_workload" {
  management_cluster_name = "partnerse-demo-mgmt"
  provisioner_name        = "partnerse-demo-tkgs"
  name                    = "${var.SESSION_NAMESPACE}-tf"

  meta {
    labels = { "key" : "test" }
  }

  spec {
    cluster_group = "default"
    tkg_service_vsphere {
      settings {
        network {
          pods {
            cidr_blocks = [
              "172.20.0.0/16",
            ]
          }
          services {
            cidr_blocks = [
              "10.96.0.0/16",
            ]
          }
        }
      }

      distribution {
        version = "v1.21.6+vmware.1-tkg.1.b3d708a"
      }

      topology {
        control_plane {
          class             = "best-effort-small"
          storage_class     = "tanzu"
          high_availability = false
        }
        node_pools {
          spec {
            worker_node_count = "1"
            tkg_service_vsphere {
              class         = "best-effort-small"
              storage_class = "tanzu"
            }
          }
          info {
            name = "default-nodepool"
          }
        }
      }
    }
  }
  ready_wait_timeout = "10m"
}
