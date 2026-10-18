output "vpc_id" {
  value = aws_vpc.lab.id
}

output "subnet_ids" {
  value = {
    public     = aws_subnet.public.id
    private    = aws_subnet.private.id
    management = aws_subnet.management.id
  }
}

output "instance_ids" {
  description = "Empty unless create_instances = true"
  value = {
    web = one(aws_instance.web[*].id)
    app = one(aws_instance.app[*].id)
  }
}
