resource "aws_ecr_repository" "default" {
  name = "${var.name}"
}
