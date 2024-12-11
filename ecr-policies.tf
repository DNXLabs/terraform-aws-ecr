
resource "aws_ecr_repository_policy" "default" {
  repository = aws_ecr_repository.default.name
  policy     = data.aws_iam_policy_document.default.json
}

data "aws_iam_policy_document" "default" {
  dynamic "statement" {
    for_each = length(try(var.trust_accounts, [])) > 0 ? [1] : []

    content {
      sid    = "AllowPull"
      effect = "Allow"

      principals {
        type        = "AWS"
        identifiers = formatlist("arn:aws:iam::%s:root", var.trust_accounts)
      }

      actions = [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "ecr:BatchCheckLayerAvailability",
        "ecr:DescribeImageScanFindings",
        "ecr:ListImages"
      ]
    }
  }

  statement {
    sid    = "AllowWriteMgmt"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }

    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:PutImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload"
    ]
  }

  dynamic "statement" {
    for_each = length(try(var.trust_accounts, [])) > 0 ? [1] : []

    content {
      sid    = "LambdaECRImageCrossAccountRetrievalPolicy"
      effect = "Allow"

      principals {
        type        = "Service"
        identifiers = ["lambda.amazonaws.com"]
      }

      actions = [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage"
      ]

      condition {
        test     = "StringLike"
        variable = "aws:sourceArn"
        values   = formatlist("arn:aws:lambda:%s:%s:function:*", data.aws_region.current.name, var.trust_accounts)
      }
    }
  }
}
