// Create cluster group
resource "tanzu-mission-control_cluster_group" "create_cluster_group" {
  name = "${var.SESSION_NAMESPACE}-cg"
}
