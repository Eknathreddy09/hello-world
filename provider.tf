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
  endpoint            = "<org name>.tmc.cloud.vmware.com" // Required, provide the org name 
  vmw_cloud_api_token = "<APi Token>"             // Required, provide the API Token
}

variable "SESSION_NAMESPACE" {}
