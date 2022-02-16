# terraform-aws-ecr

[![Lint Status](https://github.com/DNXLabs/terraform-aws-ecr/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-ecr/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-ecr)](https://github.com/DNXLabs/terraform-aws-ecr/blob/master/LICENSE)

This terraform module creates an Amazon Web Services (AWS) Elastic Container Registry (ECR) repository.

The following resources will be created:

 - ECR Repository
   - Set the Amazon ECR image scanning on push  = true
      - Amazon ECR image scanning helps in identifying software vulnerabilities in your container images.
 - ECR policies
 - Create a ECR lifecyle
    - Expire images older than 14 days
    - Expire images with feature tag
    - Expire images with the same tag

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
| ecr\_cmk\_encryption | Enabled KMS CMK encryption for ECR repository | `bool` | `false` | no |
| name | Name for ECR repository | `any` | n/a | yes |
| trust\_accounts | Accounts to trust and allow ECR fetch | `list(string)` | n/a | yes |

## Outputs

No output.

<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-ecr/blob/master/LICENSE) for full details.
