variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "name" {
  description = "Name prefix for resources"
  type        = string
  default     = "netlab"

  validation {
    condition     = can(regex("^[a-z0-9-]{1,20}$", var.name))
    error_message = "name must be 1-20 characters: lowercase letters, digits and hyphens."
  }
}

variable "vpc_cidr" {
  description = "VPC CIDR (a /16 is expected; subnets are /24s carved from it)"
  type        = string
  default     = "10.20.0.0/16"

  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0)) && tonumber(split("/", var.vpc_cidr)[1]) == 16
    error_message = "vpc_cidr must be a valid IPv4 CIDR with a /16 prefix."
  }
}

variable "admin_cidr" {
  description = "CIDR allowed to reach the management subnet (use your own /32; default is a documentation range that reaches nobody)"
  type        = string
  default     = "203.0.113.10/32"

  validation {
    condition     = can(cidrhost(var.admin_cidr, 0)) && var.admin_cidr != "0.0.0.0/0"
    error_message = "admin_cidr must be a valid CIDR and must not be 0.0.0.0/0."
  }
}

variable "web_ingress_cidrs" {
  description = "CIDRs allowed to reach the web tier on 80/443. Default-deny: empty means nobody."
  type        = list(string)
  default     = []

  validation {
    condition     = alltrue([for c in var.web_ingress_cidrs : can(cidrhost(c, 0))])
    error_message = "Every entry in web_ingress_cidrs must be a valid CIDR."
  }
}

variable "create_instances" {
  description = "Create the two EC2 instances. Default false so a first apply is network-only and costs nothing."
  type        = bool
  default     = false
}

variable "instance_type" {
  description = "EC2 instance type for both instances"
  type        = string
  default     = "t3.micro"

  validation {
    condition     = can(regex("^t3\\.(nano|micro|small)$", var.instance_type))
    error_message = "instance_type is limited to t3.nano, t3.micro or t3.small to keep the lab cheap."
  }
}
