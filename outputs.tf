output "api_gateway_url" {
  description = "HTTP API Gateway URL"
  value       = module.http_api.api_endpoint
}

output "api_gateway_id" {
  description = "HTTP API Gateway ID"
  value       = module.http_api.api_id
}
