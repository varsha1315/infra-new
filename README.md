# ☁️ Azure Infrastructure Management with Terraform (`infra-new`) 🚀

> ⚡ **Modular Infrastructure-as-Code (IaC)** repository built with Terraform to provision, manage, and scale Microsoft Azure resources dynamically across multiple environment tiers (`preprod`, `prod`).

---

## 📁 Repository Structure

```text
infra-new/
├── 🌐 environment/
│   ├── 🧪 preprod/              # Pre-production environment configurations
│   │   ├── main.tf           # Module orchestration & deployment logic
│   │   ├── provider.tf       # Terraform provider & Azure Blob backend setup
│   │   ├── variable.tf       # Top-level input variable definitions
│   │   └── terraform.tfvars  # Environment-specific variable values
│   └── 🏭 prod/                 # Production environment directory (ready for expansion)
├── 📦 modules/                  # Reusable Terraform modules (data-driven via for_each)
│   ├── 📁 azurerm_resource_group/   # Azure Resource Group module
│   ├── 🌐 azurerm_vnet/             # Azure Virtual Network module
│   ├── 🔀 azurerm_subnet/           # Azure Subnet module
│   ├── 🌐 azurerm_public_ip/        # Azure Public IP module
│   └── 🖥️ azurerm_virtual_machine/  # Azure Linux Virtual Machine & NIC module
└── 📄 README.md                 # Repository documentation
```

---

## 🛠️ Infrastructure Modules

The architecture leverages reusable Terraform modules engineered for multi-resource provisioning using Terraform `for_each` maps:

1. 📦 **[Resource Group Module](file:///c:/Users/Lenovo/Documents/Devops%20Insider/Terraform/GIT%20practice/infra-new/modules/azurerm_resource_group/main.tf)** (`modules/azurerm_resource_group`)  
   *Provisions and tags Azure Resource Groups.*

2. 🌐 **[Virtual Network Module](file:///c:/Users/Lenovo/Documents/Devops%20Insider/Terraform/GIT%20practice/infra-new/modules/azurerm_vnet/main.tf)** (`modules/azurerm_vnet`)  
   *Manages Azure Virtual Networks (VNets) and address spaces.*

3. 🔀 **[Subnet Module](file:///c:/Users/Lenovo/Documents/Devops%20Insider/Terraform/GIT%20practice/infra-new/modules/azurerm_subnet/main.tf)** (`modules/azurerm_subnet`)  
   *Provisions subnets within target VNets.*

4. 🌐 **[Public IP Module](file:///c:/Users/Lenovo/Documents/Devops%20Insider/Terraform/GIT%20practice/infra-new/modules/azurerm_public_ip/main.tf)** (`modules/azurerm_public_ip`)  
   *Creates static or dynamic Azure Public IP addresses.*

5. 🖥️ **[Virtual Machine Module](file:///c:/Users/Lenovo/Documents/Devops%20Insider/Terraform/GIT%20practice/infra-new/modules/azurerm_virtual_machine/main.tf)** (`modules/azurerm_virtual_machine`)  
   *Dynamically resolves subnets and public IPs to attach Network Interfaces (NICs) and spin up Linux VMs (Ubuntu).*

---

## ⚡ Prerequisites

Before deploying infrastructure, ensure your local workspace has the following configured:

- 🛠️ **[Terraform](https://www.terraform.io/downloads.html)** (`v1.0.0+` | AzureRM Provider `=4.1.0`)
- 💻 **[Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)** installed
- 🔑 Active **Azure Subscription** with appropriate IAM permissions
- 🗄️ Azure Storage Account provisioned for remote `.tfstate` storage

---

## 🚀 Getting Started & Deployment Workflow

### 1️⃣ Authenticate with Azure
Log in to your Azure account using Azure CLI:
```bash
az login
```
Set your target subscription context:
```bash
az account set --subscription "<YOUR_SUBSCRIPTION_ID>"
```

### 2️⃣ Navigate to Target Environment
Switch into the desired environment directory (e.g., `preprod`):
```bash
cd environment/preprod
```

### 3️⃣ Initialize Terraform Working Directory
Fetch module dependencies and connect to the Azure Blob backend:
```bash
terraform init
```

### 4️⃣ Preview Infrastructure Plan
Generate and inspect the execution plan before making changes:
```bash
terraform plan
```

### 5️⃣ Apply Configurations
Provision infrastructure on Microsoft Azure:
```bash
terraform apply
```

---

## 🔒 State Management & Remote Backend

This project uses **Azure Blob Storage** for centralized and secure state management:

- 🏢 **Resource Group**: `RG-DEV`
- 🗄️ **Storage Account**: `sgdev12`
- 📦 **Container**: `tfstate`
- 🔑 **State File Key**: `<environment>.tfstate` (e.g., `preprod.tfstate`)

---

## 🛡️ Security & Best Practices

- 🔑 **Secrets Management**: Admin credentials and sensitive secrets should be injected via **Azure Key Vault** or environment variables (`TF_VAR_...`) in production environments rather than hardcoded in `.tfvars`.
- 🙈 **Git Protection**: `.gitignore` is pre-configured to ensure local `.tfstate`, `.terraform/` plugins, and temporary cache files are never committed to version control.