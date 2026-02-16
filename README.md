# Azure IAM Labs

Hands-on Azure IAM labs demonstrating enterprise identity and access management using Azure RBAC, Managed Identity, Service Principals, Key Vault, and secure resource access control.

These labs simulate real-world enterprise IAM scenarios in Microsoft Azure cloud environments and reflect the responsibilities of IAM Engineers and Cloud Identity Engineers.

---

## Lab Progression

These labs follow real-world Azure IAM implementation order:

Foundation → Access Control → Identity Authentication → Secure Resource Access → Least Privilege Roles

---

## Labs Included

### 1️⃣ Resource Group Creation and RBAC Foundation
Created Azure Resource Group to organize resources and establish IAM access control foundation.

Skills demonstrated:

- Resource Group creation
- Azure resource organization
- IAM scope boundaries
- RBAC scope preparation
- Azure subscription resource management

📁 Folder: resource-group-rbac/

---

### 2️⃣ Virtual Machine RBAC
Assigned IAM roles to control access to Azure Virtual Machines.

Skills demonstrated:

- VM access control
- Role assignment at resource scope
- Least privilege enforcement

📁 Folder: virtual-machine-rbac/

---

### 3️⃣ Managed Identity Configuration
Configured system-assigned Managed Identity for secure authentication to Azure resources without storing credentials.

Skills demonstrated:

- Managed Identity creation
- Passwordless authentication
- Secure service-to-service authentication

📁 Folder: managed-identity/

---

### 4️⃣ Azure Key Vault Access Control
Configured RBAC and access policies to securely manage secrets and control access.

Skills demonstrated:

- Secret access control
- Secure credential storage
- RBAC-based secret access
- Enterprise secret management

📁 Folder: key-vault-access/

---

### 5️⃣ Custom RBAC Role Creation
Created custom Azure RBAC roles using least privilege access model.

Skills demonstrated:

- Custom role creation
- Least privilege access design
- Enterprise IAM role engineering

📁 Folder: custom-rbac-role/

---

### 6️⃣ Storage Account Access Control
Configured RBAC roles for secure access to Azure Storage resources.

Skills demonstrated:

- Storage access control
- Identity-based access enforcement
- Resource-level IAM configuration

📁 Folder: storage-account-access/

---

## Skills Demonstrated

### Azure Identity and Access Management

- Azure RBAC configuration
- Role assignment and access control
- Resource-level IAM implementation
- Scope-based access control
- Least privilege security model

### Identity Authentication and Security

- Managed Identity authentication
- Service Principal authentication
- Secure credential-free authentication
- Enterprise identity architecture

### Secure Resource Access

- Azure Key Vault access control
- Storage Account access management
- Virtual Machine IAM access control
- Secret and credential protection

### Cloud IAM Architecture

- Identity-based access enforcement
- Resource group access boundaries
- Enterprise IAM design patterns
- Cloud security best practices

---

## Tools Used

- Microsoft Azure Portal
- Microsoft Entra ID
- Azure RBAC
- Azure Managed Identity
- Azure Key Vault
- Azure Virtual Machines
- Azure Storage Accounts
- GitHub

---

## Repository Structure
