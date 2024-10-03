resource "aws_dynamodb_table" "terraform_statelock" {
  name  = "main_route_table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}