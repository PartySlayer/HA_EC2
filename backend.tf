resource "aws_s3_bucket" "backend" {

  bucket = "tf-backend-87878787"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name = "bucket_backend"
  }
}

resource "aws_dynamodb_table" "statelock" {
  name         = "state-lock"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}

# terraform {
#    backend "s3" {
#     bucket         = "tf-backend-87878787"
#     key            = "tf/terraform.tfstate"
#     region         = "eu-south-1"
#     dynamodb_table = "state-lock"
    
#   }
# }