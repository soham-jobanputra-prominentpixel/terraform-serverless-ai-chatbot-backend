data "aws_iam_policy_document" "lambda" {

  statement {
    sid    = "DynamoDB"
    effect = "Allow"

    actions = [
      "dynamodb:PutItem",
      "dynamodb:GetItem",
      "dynamodb:UpdateItem",
      "dynamodb:DeleteItem",
      "dynamodb:BatchGetItem",
      "dynamodb:BatchWriteItem",
      "dynamodb:Query",
      "dynamodb:Scan",
      "dynamodb:ConditionCheckItem"
    ]

    resources = [
      module.dynamodb_table.dynamodb_table_arn,
      "${module.dynamodb_table.dynamodb_table_arn}/index/*"
    ]
  }

  statement {
    sid    = "BedrockInvokeModel"
    effect = "Allow"

    actions = [
      "bedrock:InvokeModel",
      "bedrock:InvokeModelWithResponseStream",
      "bedrock:Converse",
      "bedrock:ConverseStream",
      "bedrock:GetInferenceProfile",
      "bedrock:UseInferenceProfile"
    ]

    resources = [
      "arn:aws:bedrock:us-east-1:501046919017:application-inference-profile/8m6t0o7xnem7",
      "arn:aws:bedrock:*::foundation-model/anthropic.claude-haiku-4-5-20251001-v1:0"
    ]
  }
}

resource "aws_lambda_permission" "allow_apigw" {
  statement_id = "AllowExecutionFromAPIGateway"

  action        = "lambda:InvokeFunction"
  function_name = module.lambda.lambda_function_name

  principal = "apigateway.amazonaws.com"

  source_arn = "${module.http_api.api_execution_arn}/*/*"
}
