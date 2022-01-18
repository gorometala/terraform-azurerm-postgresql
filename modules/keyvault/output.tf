output "db_pass" { 
    value = azurerm_key_vault_secret.vmpassword.value
}