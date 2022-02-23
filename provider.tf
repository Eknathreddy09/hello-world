// Tanzu Mission Control terraform provider initialization

terraform {
  required_providers {
    tanzu-mission-control = {
      source  = "vmware/tanzu-mission-control"
      version = "1.0.1"
    }
  }
}

// Basic details needed to configure Tanzu Mission Control provider
provider "tanzu-mission-control" {
  endpoint            = "partnertanzuseamericas.tmc.cloud.vmware.com" // Required, environment variable: TMC_ENDPOINT
  vmw_cloud_api_token = "09dG7PwP1SazHfc7ElXljAT8GcbQfnDjGI7Y14ZlOvBb1qRRBfabHQ052evxxqtl"             // Required, environment variable: VMW_CLOUD_API_TOKEN
}

variable "SESSION_NAMESPACE" {}
