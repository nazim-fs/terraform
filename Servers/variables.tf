variable "aws_region" {
  description = "AWS region to create resources"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of security groups to be attached"
  type        = list(any)
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "availability_zones" {
  type = list(any)
}

variable "ami" {
  type = string
}

variable "service" {
  type = string
}

variable "cluster" {
  type = string
}

variable "os" {
  type = string
}

variable "instance_name_list" {
  type = list(any)
}