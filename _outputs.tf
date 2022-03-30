output "ecr_name" {
  value = aws_ecr_repository.default.name
}

output "ecr_arn" {
  value = aws_ecr_repository.default.arn
}

output "ecr_url" {
  value = aws_ecr_repository.default.repository_url
}
