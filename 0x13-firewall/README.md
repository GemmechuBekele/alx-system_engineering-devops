# Firewall configuration with UFW

This task installs and configures UFW firewall on `web-01` so that:
- All incoming connections are denied by default.
- Only TCP ports 22 (SSH), 80 (HTTP), and 443 (HTTPS) are allowed.
- All outgoing connections are allowed.
