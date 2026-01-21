terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
}

provider "azurerm" {
  features{}
subscription_id="c46beff3-d22c-4a6f-82a7-693fd94c69c4"

}
