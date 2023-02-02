resource "aws_ecr_repository" "default" {
  name                 = var.name
  image_tag_mutability = var.image_tag_mutability

  encryption_configuration {
    encryption_type = "KMS"
    kms_key         = length(var.kms_key_arn) > 0 ? var.kms_key_arn : ""
  }

  tags = merge(
    var.tags,
    {
      "Name" = "${var.name}"
    },
  )

}
