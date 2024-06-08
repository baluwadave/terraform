output "instance_ids" {
  description = "The IDs of the created EC2 instances"
  value       = module.my_instances[*].instance_ids
}

output "aws_vpc" {
  value = module.vpc.vpc_id
  description="This is my public subnet id"
}