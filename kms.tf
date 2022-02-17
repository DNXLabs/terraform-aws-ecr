data "aws_iam_policy_document" "kms_policy_ecr" {
  count = var.ecr_cmk_encryption ? 1 : 0
  statement {
    sid    = "Allow direct access to key metadata to the account"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
    actions = [
      "kms:*"
    ]
    resources = ["*"]
  }
  statement {
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey",
      "kms:CreateGrant",
      "kms:RetireGrant"
    ]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    resources = ["*"]
    condition {
      test     = "StringEquals"
      variable = "kms:CallerAccount"
      values   = [join(",", var.trust_accounts)]
    }
    condition {
      test     = "StringEquals"
      variable = "kms:ViaService"
      values   = ["ecr.${data.aws_region.current.name}.amazonaws.com"]
    }
    sid = "Allow access through Amazon ECR for all principals in the account that are authorized to use Amazon ECR"
  }
}


resource "aws_kms_key" "ecr" {
  count                   = var.ecr_cmk_encryption ? 1 : 0
  deletion_window_in_days = 30
  description             = "Customer-managed key that protects ECR data"
  enable_key_rotation     = true
  policy                  = data.aws_iam_policy_document.kms_policy_ecr[0].json
}

resource "aws_kms_alias" "ecr" {
  count         = var.ecr_cmk_encryption ? 1 : 0
  name          = "alias/cmk/ecr"
  target_key_id = aws_kms_key.ecr[0].key_id
}