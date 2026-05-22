variable "region" {
  description = "AWS region to create resources at"
  type        = string
}

variable "project_name" {
  description = "Project name is used in names of resources as well"
  type        = string
}

variable "model_id" {
  description = "Amazon bedrock model id"
  type        = string
}
