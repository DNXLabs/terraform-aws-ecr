resource "aws_ecr_repository" "default" {
  name = var.name

  encryption_configuration {
    encryption_type = "KMS"
    kms_key         = length(var.kms_key_arn) > 0 ? var.kms_key_arn : ""
  }
}
