# Lab 8 — Azure Workload Identity and Key Vault Access

## Objective

Demonstrate passwordless access from an Azure workload to Azure Key Vault using a system-assigned managed identity and Azure RBAC.

This lab simulates a real enterprise pattern where an Azure Automation Account retrieves a secret from Key Vault without storing usernames, passwords, client secrets, or certificates in code.

---

## Scenario

An Azure workload needs to read a secret from Key Vault.

Instead of embedding credentials in the script, the workload uses its system-assigned managed identity. Azure RBAC grants that identity only the permissions required to read secrets from the target vault.

This demonstrates the difference between:

- Human identity access to Azure resources
- Workload identity access between Azure services
- Management-plane permissions and data-plane secret permissions
- Credential-based authentication and passwordless authentication

---

## Lab Environment

- Platform: Microsoft Azure
- Workload: Azure Automation Account
- Identity Type: System-assigned managed identity
- Secret Store: Azure Key Vault
- Authorization Model: Azure role-based access control
- Access Scope: Key Vault resource
- Runbook Language: PowerShell

---

## Architecture

```text
Azure Automation Account
        |
        | System-assigned managed identity
        v
Azure RBAC role assignment
        |
        | Key Vault Secrets User
        v
Azure Key Vault
        |
        | Read secret metadata/value during runbook execution
        v
PowerShell validation output
```

---

## Evidence

Screenshots for this lab belong in `screenshots/` using sanitized filenames.

| File | Purpose |
| --- | --- |
| `01-empty-resource-group.png` | Shows the clean lab resource group before deployment |
| `02-key-vault-rbac-configuration.png` | Shows Key Vault configured for Azure RBAC |
| `03-key-vault-overview.png` | Shows the deployed Key Vault |
| `04-automation-account-managed-identity.png` | Shows the system-assigned managed identity enabled |
| `05-key-vault-secrets-user-role.png` | Shows the least-privilege Key Vault role selection |
| `06-managed-identity-selected.png` | Shows the Automation Account managed identity selected as the principal |
| `07-role-assignment-review.png` | Shows the final Key Vault role assignment review |
| `08-user-denied-key-vault-data-access.png` | Shows user access denied without data-plane permission |
| `09-admin-secrets-officer-assignment.png` | Shows administrative secret-management access for lab setup |
| `10-test-secret-created.png` | Shows the test secret exists without exposing its value |
| `11-runbook-published.png` | Shows the PowerShell runbook published |
| `12-managed-identity-keyvault-success.png` | Shows successful managed identity authentication and Key Vault secret retrieval |

Do not include screenshots that reveal secret values, tenant IDs, subscription IDs, object IDs, access tokens, or other sensitive data.

---

## Lab Steps

### Step 1 — Create or Select a Resource Group

Create or select a resource group dedicated to the lab.

Evidence: `screenshots/01-empty-resource-group.png`

---

### Step 2 — Create an Azure Key Vault

Create a Key Vault and configure it to use Azure RBAC for authorization.

Key configuration:

- Permission model: Azure role-based access control
- Public network access: Configured according to lab environment
- Soft delete: Enabled
- Purge protection: Optional for lab, recommended in production

Evidence:

- `screenshots/02-key-vault-rbac-configuration.png`
- `screenshots/03-key-vault-overview.png`

---

### Step 3 — Create an Azure Automation Account

Create an Azure Automation Account in the same subscription and enable a system-assigned managed identity.

Evidence: `screenshots/04-automation-account-managed-identity.png`

---

### Step 4 — Assign Key Vault RBAC Access

Assign the Automation Account managed identity the following role at the Key Vault scope:

```text
Key Vault Secrets User
```

This grants the workload permission to read Key Vault secrets without giving broader administrative access.

Evidence:

- `screenshots/05-key-vault-secrets-user-role.png`
- `screenshots/06-managed-identity-selected.png`
- `screenshots/07-role-assignment-review.png`

---

### Step 5 — Verify Human User Data-Plane Restriction

Validate that a user without Key Vault data-plane permission cannot read the secret value.

This confirms that access is controlled by RBAC and that the workload identity is the intended access path.

Evidence: `screenshots/08-user-denied-key-vault-data-access.png`

---

### Step 6 — Create a Test Secret

Create a test secret in Key Vault.

Important: screenshots and documentation should confirm the secret exists, but must not expose the secret value.

Evidence:

- `screenshots/09-admin-secrets-officer-assignment.png`
- `screenshots/10-test-secret-created.png`

---

### Step 7 — Run the PowerShell Runbook

Use the runbook in this lab:

```text
scripts/Test-KeyVault-ManagedIdentity.ps1
```

The runbook authenticates using the Automation Account managed identity, reads the configured Key Vault secret, and prints only safe validation metadata.

Evidence:

- `screenshots/11-runbook-published.png`
- `screenshots/12-managed-identity-keyvault-success.png`

---

## Result

Successfully validated passwordless workload access to Azure Key Vault.

The Azure Automation Account used its system-assigned managed identity to authenticate to Azure and retrieve a Key Vault secret through Azure RBAC. No secret values, passwords, client secrets, or certificates were stored in the runbook.

---

## Skills Demonstrated

- Azure workload identity design
- System-assigned managed identity configuration
- Azure Key Vault RBAC authorization
- Key Vault data-plane access control
- Least privilege role assignment
- Passwordless authentication between Azure services
- PowerShell automation for identity validation
- Secret handling without exposing secret values

---

## Security Notes

- The runbook does not print secret values.
- The managed identity is scoped to the Key Vault resource.
- The recommended role is `Key Vault Secrets User`, not Key Vault Administrator.
- Screenshots should be reviewed before commit to remove sensitive values.
- Test secrets should be deleted after the lab if they are no longer needed.

---

## Real-World Relevance

This pattern is commonly used in enterprise Azure environments for:

- Automation jobs that need secure secret retrieval
- Applications that should not store credentials in code
- Reducing risk from leaked client secrets
- Enforcing least privilege access to sensitive data
- Separating user access from workload access

Relevant roles include:

- IAM Engineer
- Cloud Identity Engineer
- Azure Administrator
- Cloud Security Engineer
- DevSecOps Engineer
