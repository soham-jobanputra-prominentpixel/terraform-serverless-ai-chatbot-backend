module "lambda" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "~> 8.7.0"

  function_name = local.lambda_function_name
  description   = "Chatbot backend lambda"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.14"

  create_package          = false
  local_existing_package  = "./lambda_function.zip"
  ignore_source_code_hash = true

  timeout     = 25
  memory_size = 512

  environment_variables = {
    DYNAMODB_TABLE = module.dynamodb_table.dynamodb_table_id
    MODEL_ID       = var.model_id
  }

  attach_policy_json = true
  policy_json        = data.aws_iam_policy_document.lambda.json
}
