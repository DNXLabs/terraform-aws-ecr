# terraform-aws-ecr

[![Lint Status](https://github.com/DNXLabs/terraform-aws-ecr/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-ecr/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-ecr)](https://github.com/DNXLabs/terraform-aws-ecr/blob/master/LICENSE)

This terraform module creates an Amazon Web Services (AWS) Elastic Container Registry (ECR) repository.

The following resources will be created:

 - ECR Repository
   - Set the Amazon ECR image scanning on push  = true
      - Amazon ECR image scanning helps in identifying software vulnerabilities in your container images.
 - ECR policies
 - ECR lifecyle

<!--- BEGIN_TF_DOCS --->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.31 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| image\_tag\_mutability | The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. Defaults to MUTABLE. | `string` | `"MUTABLE"` | no |
| kms\_key\_arn | KMS Key ARN to use a CMK instead of default key | `string` | n/a | yes |
| name | Name for ECR repository | `any` | n/a | yes |
| tags | Map of tags that will be added to created resources. By default resources will be tagged with name and environment. | `map(string)` | `{}` | no |
| trust\_accounts | Accounts to trust and allow ECR fetch | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| ecr\_arn | n/a |
| ecr\_name | n/a |
| ecr\_url | n/a |

<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-ecr/blob/master/LICENSE) for full details.
