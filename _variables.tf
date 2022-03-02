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