variable "name" {
  description = "Name for ECR repository"
}

variable "trust_accounts" {
  type        = list(string)
  description = "Accounts to trust and allow ECR fetch"
}

variable "kms_key_arn" {
  type        = string
  description = "KMS Key ARN to use a CMK instead of default key"
}

variable "image_tag_mutability" {
  type        = string
  description = "The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. Defaults to MUTABLE."
  default     = "MUTABLE"
}

variable "tags" {
  description = "Map of tags that will be added to created resources. By default resources will be tagged with name and environment."
  type        = map(string)
  default     = {}
}