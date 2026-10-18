# Security policy

## Scope and safety
Terraform defaults are deny-by-default (no web ingress CIDRs, empty default security group, `admin_cidr` rejects 0.0.0.0/0), instances are off unless `create_instances = true`, state and `*.tfvars` are git-ignored, and no secrets are in the repo. Always review `terraform plan` and use a sandbox account.

## What was and was not tested
**Tested (automated, in CI and locally):** `terraform fmt -check`, `terraform init -backend=false`, `terraform validate`, `tflint` (core + AWS ruleset), `ansible-playbook --syntax-check` and `ansible-lint`, locally and in CI.

**Not tested:** `terraform plan` and `terraform apply` (they need AWS credentials and were never run), the real cost of a deployment, the pre-commit hook configuration, and the Ansible playbook on any real host.

## Reporting a problem
This is a small personal portfolio project, not a supported product. If you find a security issue, please open a GitHub issue **without** secrets, credentials or real system details, or use GitHub's "Report a vulnerability" button on the Security tab if it is enabled.
