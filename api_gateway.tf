module "http_api" {
  source  = "terraform-aws-modules/apigateway-v2/aws"
  version = "~> 6.1.0"

  name          = "${var.project_name}-http-api"
  description   = "HTTP API for AI chatbot backend"
  protocol_type = "HTTP"

  create_domain_name = false

  cors_configuration = {
    allow_credentials = false

    allow_headers = [
      "content-type",
      "authorization",
    ]

    allow_methods = [
      "GET",
      "POST",
      "DELETE",
      "OPTIONS",
    ]

    allow_origins = [
      "*"
    ]

    expose_headers = [
      "content-type"
    ]

    max_age = 300
  }

  stage_default_route_settings = {
    detailed_metrics_enabled = true
    throttling_burst_limit   = 100
    throttling_rate_limit    = 50
  }

  routes = {
    "POST /sessions" = {
      integration = {
        uri                    = module.lambda.lambda_function_invoke_arn
        payload_format_version = "2.0"
        timeout_milliseconds   = 30000
        description            = "Create new chat session"
      }
    }

    "GET /sessions" = {
      integration = {
        uri                    = module.lambda.lambda_function_invoke_arn
        payload_format_version = "2.0"
        timeout_milliseconds   = 30000
        description            = "List chat sessions"
      }
    }

    "DELETE /sessions/{sessionId}" = {
      integration = {
        uri                    = module.lambda.lambda_function_invoke_arn
        payload_format_version = "2.0"
        timeout_milliseconds   = 30000
        description            = "Delete session and all messages"
      }
    }

    "POST /sessions/{sessionId}/messages" = {
      integration = {
        uri                    = module.lambda.lambda_function_invoke_arn
        payload_format_version = "2.0"
        timeout_milliseconds   = 30000
        description            = "Send message to Bedrock and persist conversation"
      }
    }

    "GET /sessions/{sessionId}/messages" = {
      integration = {
        uri                    = module.lambda.lambda_function_invoke_arn
        payload_format_version = "2.0"
        timeout_milliseconds   = 30000
        description            = "Get full session message history"
      }
    }
  }
}
