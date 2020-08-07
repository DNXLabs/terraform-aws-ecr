# terraform-aws-ecr

terraform-aws-ecr creates an Amazon Web Services (AWS) Elastic Container Registry (ECR) repository.

This module requires:
 * Terraform Version >=0.12.20

This module defines:

 * ECR policies 
 * Create a ECR lifecyle
    - Expire images older than 14 days
    - Expire images with feature tag
    - Expire images with the same tag

 


[![Lint Status](https://github.com/DNXLabs/terraform-aws-ecr/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-ecr/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-ecr)](https://github.com/DNXLabs/terraform-aws-ecr/blob/master/LICENSE)

<!--- BEGIN_TF_DOCS --->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.20 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name for ECR repository | `any` | n/a | yes |
| trust\_accounts | Accounts to trust and allow ECR fetch | `list(string)` | n/a | yes |

## Outputs

No output.

<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-ecr/blob/master/LICENSE) for full details.
