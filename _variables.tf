variable "name" {
  description = "Name for ECR repository"
}

variable "trust_accounts" {
  type        = "list"
  description = "Accounts to trust and allow ECR fetch"
}
