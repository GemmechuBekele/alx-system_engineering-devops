# 0x0F. Load Balancer

This project is part of the ALX System Engineering & DevOps curriculum.

## Task: Custom HTTP Response Header

The goal of the first task is to configure Nginx so that its HTTP responses include a custom header:

- **Header Name:** `X-Served-By`
- **Header Value:** The hostname of the server serving the request.

We implement this using a Bash script (`0-custom_http_response_header`) that:
1. Installs and configures Nginx on a fresh Ubuntu 16.04 LTS machine.
2. Adds the `X-Served-By` header globally.
3. Uses `$hostname` so that each server identifies itself automatically.
4. Reloads Nginx after configuration.

## Usage
Run the script on both `web-01` and `web-02`:

```bash
chmod +x 0-custom_http_response_header
sudo ./0-custom_http_response_header
