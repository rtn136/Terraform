resource "aws_dynamodb_table" "ddb_backend" {
  name = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key = var.field_name

  attribute {
    name = var.field_name
    type = "S"
  }
}