resource "aws_ecr_repository" "default" {
  name                 = var.name
  image_tag_mutability = var.image_tag_mutability

  encryption_configuration {
    encryption_type = var.kms_key_arn != "" ? "KMS" : var.encryption_type
    kms_key         = var.kms_key_arn
  }

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  tags = merge(
    var.tags,
    {
      "Name" = var.name
    },
  )

}
