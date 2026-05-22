module "dynamodb_table" {
  source  = "terraform-aws-modules/dynamodb-table/aws"
  version = "~> 5.5.0"

  name      = "${var.project_name}-dynamodb"
  hash_key  = "sessionId"
  range_key = "dialogueTimestamp"

  table_class                 = "STANDARD"
  deletion_protection_enabled = false

  attributes = [
    { name = "sessionId", type = "S" },
    { name = "dialogueTimestamp", type = "S" },
  ]
}
