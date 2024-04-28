variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "ap-southeast-1"
}

variable "aws_account_id" {
  description = "The AWS account ID where resources will be created."
  type        = string
  default     = "767397984419"
}

variable "example_tag" {
  description = "An example tag to apply to resources."
  type        = map(string)
  default     = {
    Name = "example-resource"
    Environment = "project"
  }
}
