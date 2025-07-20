# Tailscale Terraform Configuration

This repository contains Terraform configuration files for managing Tailscale network settings using Infrastructure as Code (IaC). It provides automated setup and management of Tailscale ACLs, DNS preferences, and nameservers.

## Overview

[Tailscale](https://tailscale.com/) is a VPN service that creates secure networks between your devices. This Terraform configuration automates the management of:

- **Access Control Lists (ACLs)**: Network access policies
- **DNS Preferences**: MagicDNS configuration 
- **DNS Nameservers**: Custom DNS server settings

## Project Structure

```sh
.
├── README.md
└── terraform/
    ├── main.tf              # Main Tailscale resources
    ├── provider.tf          # Terraform provider configuration
    ├── variables.tf         # Variable definitions
    ├── values.auto.tfvars   # Variable values (contains sensitive data)
    └── terraform.tfstate    # Terraform state file
```

## Prerequisites

Before using this configuration, ensure you have:

1. **Terraform** installed (version 0.12 or later)
2. A **Tailscale account** with admin access
3. A **Tailscale API key** with appropriate permissions

## Usage

### Initial Setup

1. **Clone this repository**:
   ```bash
   git clone <repository-url>
   cd tailscale
   ```

2. **Navigate to the terraform directory**:
   ```bash
   cd terraform
   ```

3. **Update the API key**:
   Edit `values.auto.tfvars` and replace the API key with your own:
   ```terraform
   tailscale_api_key = "your-tailscale-api-key-here"
   ```

4. **Initialize Terraform**:
   ```bash
   terraform init
   ```

5. **Plan the deployment**:
   ```bash
   terraform plan
   ```

6. **Apply the configuration**:
   ```bash
   terraform apply
   ```

### Destroying Resources

To remove all Tailscale configurations managed by this Terraform:

```bash
terraform destroy
```

## License

This project is open source. Please check the LICENSE file for details.