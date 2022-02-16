variable "name" {
  description = "Name for ECR repository"
}

variable "trust_accounts" {
  type        = list(string)
  description = "Accounts to trust and allow ECR fetch"
}

variable "ecr_cmk_encryption" {
  type        = bool
  description = "Enabled KMS CMK encryption for ECR repository"
  default     = false
}