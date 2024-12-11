variable "name" {
  description = "Name for ECR repository"
}

variable "trust_accounts" {
  type        = list(string)
  description = "Accounts to trust and allow ECR fetch"
}

variable "encryption_type" {
  type        = string
  description = "Encryption type, KMS or AES256. When kms_key_arn is passed, encryption_type is always KMS"
  default     = "KMS"
}

variable "kms_key_arn" {
  type        = string
  description = "KMS Key ARN to use a CMK instead of default key"
  default     = ""
}

variable "image_tag_mutability" {
  type        = string
  description = "The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. Defaults to MUTABLE."
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "Configuration block that defines image scanning configuration for the repository."
  type        = bool
  default     = true
}

variable "lifecycle_policy" {
  description = "JSON formatted string ECR repository lifecycle policy."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Map of tags that will be added to created resources. By default resources will be tagged with name and environment."
  type        = map(string)
  default     = {}
}
