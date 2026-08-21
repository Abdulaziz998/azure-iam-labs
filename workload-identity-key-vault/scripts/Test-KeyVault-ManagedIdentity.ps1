<#
.SYNOPSIS
Validates Azure Key Vault secret access using an Azure Automation Account system-assigned managed identity.

.DESCRIPTION
This runbook authenticates to Azure with the Automation Account managed identity and reads a Key Vault secret.
It intentionally does not print the secret value. Output is limited to safe validation details.

.PARAMETER VaultName
Name of the Azure Key Vault.

.PARAMETER SecretName
Name of the Key Vault secret to validate.

.EXAMPLE
.\Test-KeyVault-ManagedIdentity.ps1 -VaultName "kv-iam-lab-demo" -SecretName "test-secret"
#>

param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$VaultName,

    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$SecretName
)

$ErrorActionPreference = "Stop"

Write-Output "Starting managed identity Key Vault access validation."
Write-Output "Target vault: $VaultName"
Write-Output "Target secret name: $SecretName"

try {
    Write-Output "Authenticating to Azure with the system-assigned managed identity..."
    $context = Connect-AzAccount -Identity

    $accountId = $context.Context.Account.Id
    $subscriptionName = $context.Context.Subscription.Name

    Write-Output "SUCCESS: Managed identity authenticated to Azure."
    Write-Output "Managed identity account ID: $accountId"
    Write-Output "Subscription context: $subscriptionName"

    Write-Output "Requesting secret from Key Vault..."
    $secret = Get-AzKeyVaultSecret -VaultName $VaultName -Name $SecretName

    if ($null -eq $secret) {
        throw "Secret '$SecretName' was not returned from vault '$VaultName'."
    }

    Write-Output "SUCCESS: Secret '$SecretName' was retrieved from Key Vault."
    Write-Output "Secret name confirmed: $($secret.Name)"
    Write-Output "Secret enabled: $($secret.Enabled)"
    Write-Output "Secret version detected: $($secret.Version)"
    Write-Output "Secret value intentionally not displayed."
}
catch {
    Write-Error "Managed identity Key Vault access validation failed. $($_.Exception.Message)"
    throw
}
finally {
    Write-Output "Validation complete."
}
