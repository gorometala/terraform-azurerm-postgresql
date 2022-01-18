terraform {
    required_providers {
    azurerm = {
        source  = "hashicorp/azurerm"
        version = "=2.46.0"
    }
}
    backend "azurerm" {
    resource_group_name      = "terraform"
    storage_account_name     = "terraform1209"
    container_name           = "terraform"
    key                      = "terraform.tfstate"
    }

}
provider "azurerm" {
    features {}
}

module "keyvault" {
    source = "./modules/keyvault"
    resource_group_name = "terraform"

}

module "postgresql" {
    source = "./modules/postgresql"
    # Mandatory variables
    resource_group_name = "terraform"
    location = "westeurope"
    server_name = "postgresql-demo"
    administrator_login = "masterofpuppets"
    administrator_password = "${module.keyvault.db_pass}"
    db_names = ["demo"]
}