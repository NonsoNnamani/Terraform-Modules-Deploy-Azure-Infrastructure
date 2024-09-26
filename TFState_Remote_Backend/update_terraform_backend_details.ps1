
$env:TF_VAR_tfstate_remote_backend_rg_name = terraform output -raw tfstate_remote_backend_rg_name
$env:TF_VAR_tfstate_remote_backend_storage_account_name = terraform output -raw tfstate_remote_backend_storage_account_name
$env:TF_VAR_tfstate_remote_backend_storage_container_name = terraform output -raw tfstate_remote_backend_storage_container_name

# Export sensitive outputs
# Optionally, print the exported variables (be careful with sensitive data)
Write-Host " "
Write-Host "Exported tfstate_remote_backend_rg_name: $env:TF_VAR_tfstate_remote_backend_rg_name"
Write-Host "Exported tfstate_remote_backend_storage_account_name: $env:TF_VAR_tfstate_remote_backend_storage_account_name"
Write-Host "Exported tfstate_remote_backend_storage_container_name: $env:TF_VAR_tfstate_remote_backend_storage_container_name"

Write-Host "To use the above in your terraform file, run the following code :"
Write-Host 'terraform init -backend-config="backend_config.tfvars"'
