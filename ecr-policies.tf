resource "aws_ecr_repository_policy" "default" {
  repository = aws_ecr_repository.default.name

  policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "AllowPull",
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          ${join(",", formatlist("\"arn:aws:iam::%s:root\"", var.trust_accounts))}
        ]
      },
      "Action": [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "ecr:BatchCheckLayerAvailability",
        "ecr:DescribeImageScanFindings"
      ]
    },
    {
      "Sid": "AllowWriteMgmt",
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        ]
      },
      "Action": [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "ecr:BatchCheckLayerAvailability",
        "ecr:PutImage",
        "ecr:InitiateLayerUpload",
        "ecr:UploadLayerPart",
        "ecr:CompleteLayerUpload"
      ]
    },
    {
      "Sid": "LambdaECRImageCrossAccountRetrievalPolicy",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "lambda.amazonaws.com"
        ]
      },
      "Action": [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage"
      ],
      "Condition": {
        "StringLike": {
          "aws:sourceArn": [
            ${join(",", formatlist("\"arn:aws:lambda:%s:%s:function:*\"", data.aws_region.current.name, var.trust_accounts))}
          ]
        }
      }
    }
  ]
}
EOF

  depends_on = [aws_ecr_repository.default]
}
