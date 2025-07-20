resource "tailscale_acl" "open" {
  acl = jsonencode({
    acls = [
      {
        action = "accept",
        src    = ["*"],
        dst    = ["*:*"]
      }
    ]
  })
}

resource "tailscale_dns_preferences" "magic_dns" {
  magic_dns = true
}

resource "tailscale_dns_nameservers" "public_dns" {
  nameservers = ["1.1.1.1", "8.8.8.8"]
}