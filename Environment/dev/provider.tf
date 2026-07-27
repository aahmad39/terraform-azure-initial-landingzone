terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.73.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name = "rg-002"
  #   storage_account_name = "scantoolsgitleaks"
  #   container_name = "testscanblob"
  #   key = "dev.tfstate"

  # }

}

provider "azurerm" {
  features {}
}