variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "ap-southeast-1"
}

variable "project_account_id" {
  description = "The AWS account ID where resources will be created."
  type        = string
}

variable "platform_account_id" {
  description = "The AWS account ID where resources will be created."
  type        = string
}

variable "project_iam_role" {
  description = "The AWS account ID where resources will be created."
  type        = string
}

variable "example_tag" {
  description = "An example tag to apply to resources."
  type        = map(string)
  default     = {
    agency = "example-resource"
    project = "project"
  }
}
