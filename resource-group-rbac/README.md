# Lab: Resource Group RBAC Configuration

## Objective

Configure Azure Role-Based Access Control (RBAC) to assign least privilege access to a user at the resource group scope.

This simulates real-world enterprise IAM access management.

---

## Lab Environment

- Platform: Microsoft Azure
- Resource Group: iam-lab-rg
- Role Assigned: Reader
- Scope: Resource Group
- Identity Type: Azure AD User

---

## Step 1: Open Resource Group IAM

Navigate to:

Azure Portal → Resource Groups → iam-lab-rg → Access control (IAM)

Screenshot:

![IAM Overview](screenshots/01-resource-group-iam-overview.png)

---

## Step 2: Select Role

Click:

Add → Add role assignment

Select role:

Reader

Screenshot:

![Select Reader Role](screenshots/02-select-reader-role.png)

---

## Step 3: Select Member

Assign role to user:

Abdulaziz Abdi

Screenshot:

![Select Member](screenshots/03-select-member-for-role.png)

---

## Step 4: Review and Assign Role

Verify:

- Role: Reader
- Scope: iam-lab-rg
- Member: Abdulaziz Abdi

Screenshot:

![Review Assignment](screenshots/04-review-role-assignment.png)

---

## Step 5: Verify Role Assignment

Confirm role assignment appears in IAM dashboard.

Screenshot:

![Role Assignment Complete](screenshots/05-role-assignment-completed.png)

---

## Result

Successfully assigned Reader role at the resource group scope.

User can now:

- View resources
- Cannot modify resources

This follows the least privilege access model.

---

## Skills Demonstrated

- Azure RBAC configuration
- Role assignment
- Resource group scope access control
- Access verification
- Least privilege security model

---

## Real-World Relevance

This is a core task performed by:

- IAM Engineers
- Cloud Identity Engineers
- Azure Administrators
- Cloud Security Engineers

RBAC ensures secure and controlled access to cloud resources.
