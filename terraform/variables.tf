variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "name" {
  description = "Name prefix for resources"
  type        = string
  default     = "netlab"
}

variable "vpc_cidr" {
  type    = string
  default = "10.20.0.0/16"
}

variable "admin_cidr" {
  description = "CIDR allowed to reach the management subnet (use your own /32; default is a documentation range)"
  type        = string
  default     = "203.0.113.10/32"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}
