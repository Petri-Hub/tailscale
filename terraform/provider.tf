terraform {
  required_providers {
    tailscale = {
      source  = "tailscale/tailscale"
    }
  }
}

provider "tailscale" {
  api_key = var.tailscale_api_key
}