variable "instance_count" {
  description = "The number of EC2 instances to create"
  type        = number

}

variable "ami_id" {
  description = "The ID of the AMI to use for EC2 instances"
  default = "ami-021a9d8a7dda97aa5"
}

variable "instance_type" {
  description = "The type of EC2 instance to create"
}
variable "key_name" {
    description = "This is my key in that region"
}



variable "subnet_id" {
  type = string
  description = "This is subnet created while created vpc"
}