resource "aws_ecr_repository" "default" {
  name = var.name

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "KMS"
    kms_key         = try(var.ecr_cmk_encryption, false) ? aws_kms_key.ecr[0].arn : null
  }

  depends_on = [aws_kms_alias.ecr]
}
