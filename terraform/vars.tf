#
# Top level variables.  Terraform inside modules may require these,
# but module instantiation typically will not override them if defaults
# are provided below
#
variable "aws_region" {
  description = "AWS Region for deploying resources into"
  type        = "string"
  default     = "us-east-1"
}

variable "availability_zone" {
  description = "default availability_zone"
  type        = "string"
  default     = "us-east-1d"
}

variable "aws_profile" {
  description = "aws profile to use"
  type        = "string"
}

variable "pub_key" {
  description = "pub key"
  type        = "string"
}
