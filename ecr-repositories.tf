resource "aws_ecr_repository" "default" {
  name = var.name

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "KMS"
    kms_key         = var.kms_key_arn != "" ? var.kms_key_arn : null
  }
}
