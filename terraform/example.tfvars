# Copy to terraform.tfvars (git-ignored) and edit. Example values only.
region = "us-west-2"
name   = "netlab"

# Your own public IP as a /32, e.g. from `curl https://checkip.amazonaws.com`.
admin_cidr = "203.0.113.10/32"

# Default-deny: leave empty to allow nobody; add CIDRs to open 80/443 to them.
web_ingress_cidrs = []

# Network only (free) until you set this to true.
create_instances = false
instance_type    = "t3.micro"
