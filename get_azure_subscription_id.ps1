$subscription = Get-AZSubscription
$subscriptionid = $subscription | where-object {$PSItem.State -Like "*Enabled*"}

# Select the first account with state enabled and save to Terraform environment variable
$Env:TF_VAR_azure_subscription_id = $subscriptionid[0].id
