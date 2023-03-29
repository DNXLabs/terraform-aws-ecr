resource "aws_ecr_lifecycle_policy" "default" {
  count      = var.lifecycle_policy != "" ? 1 : 0
  repository = aws_ecr_repository.default.name

  policy = var.lifecycle_policy
}
