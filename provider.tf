terraform {
  version ~> 3.1
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }

provider "azurerm" {
  subscription_id = "73de6881-2d08-471d-9c59-6f32608206d3"
  tenant_id       = "4f31d5a0-4f8c-4fe4-a9a3-7398b5099a99"
  client_id       = "e5e697ac-4a01-4135-8d9a-62af95afb99a"
  client_secret   = "uHv8Q~iuPoLyCEqpGZaD0LPtcg~IfQ3j7EGM9a--"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
