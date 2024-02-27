resource "aws_dynamodb_table" "database" {
  hash_key = "company_name"
  name     = "glassdoor_reviews"

  // We need to keep under 25 to stay within the free tier
  read_capacity  = 25
  write_capacity = 25

  attribute {
    name = var.primary_key.name
    type = var.primary_key.type
  }

  dynamic "attribute" {
    for_each = var.columns
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }
}