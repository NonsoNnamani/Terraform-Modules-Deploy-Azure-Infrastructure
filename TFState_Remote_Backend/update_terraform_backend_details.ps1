
$env:TF_VAR_tfstate_remote_backend_rg_name = terraform output -raw tfstate_remote_backend_rg_name
$env:TF_VAR_tfstate_remote_backend_storage_account_name = terraform output -raw tfstate_remote_backend_storage_account_name
$env:TF_VAR_tfstate_remote_backend_storage_container_name = terraform output -raw tfstate_remote_backend_storage_container_name

# Export sensitive outputs
# Optionally, print the exported variables (be careful with sensitive data)
Write-Host "Exported tfstate_remote_backend_rg_name: $env:TF_VAR_tfstate_remote_backend_rg_name"
Write-Host "Exported tfstate_remote_backend_storage_account_name: $env:TF_VAR_tfstate_remote_backend_storage_account_name"
Write-Host "Exported tfstate_remote_backend_storage_container_name: $env:TF_VAR_tfstate_remote_backend_storage_container_name"
