terraform {
  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    tls = {
      source = "hashicorp/tls"
      version = "~>4.0"
    }
  }
}

provider "azurerm" {
    subscription_id = "6e550cef-addf-40fa-b6b8-b2927adae8bf"
    client_id = "9c37dc81-83c2-4cd7-bf51-062bf9ff2cac"
    client_secret = "~VS8Q~3EWWLHgALaUQUBjmDIMQmboD1JC6FjLakn"
    tenant_id = "0484b512-d182-42db-8f62-2ffb0fbe6ae9"
  features {}
}
