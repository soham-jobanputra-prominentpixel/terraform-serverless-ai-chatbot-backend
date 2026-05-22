<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.14.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.38.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.38.0 |

## Modules

| Name | Source | Version |
| ---- | ------ | ------- |
| <a name="module_http_api"></a> [http\_api](#module\_http\_api) | terraform-aws-modules/apigateway-v2/aws | ~> 6.1.0 |
| <a name="module_dynamodb_table"></a> [dynamodb\_table](#module\_dynamodb\_table) | terraform-aws-modules/dynamodb-table/aws | ~> 5.5.0 |
| <a name="module_lambda"></a> [lambda](#module\_lambda) | terraform-aws-modules/lambda/aws | ~> 8.7.0 |

## Resources

| Name | Type |
| ---- | ---- |
| [aws_lambda_permission.allow_apigw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_iam_policy_document.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_region"></a> [region](#input\_region) | AWS region to create resources at | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name is used in names of resources as well | `string` | n/a | yes |
| <a name="input_model_id"></a> [model\_id](#input\_model\_id) | Amazon bedrock model id | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_api_gateway_url"></a> [api\_gateway\_url](#output\_api\_gateway\_url) | HTTP API Gateway URL |
| <a name="output_api_gateway_id"></a> [api\_gateway\_id](#output\_api\_gateway\_id) | HTTP API Gateway ID |
<!-- END_TF_DOCS -->
