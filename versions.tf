terraform {
    required_version = "~> 1.4.0"

    required_providers {
      aws = {
        version = "~> 4.59.0"
      }
    }

    backend "s3" {
      bucket = "ratan-s3-terraform-backend-5378637678"
      key = "main/terraform.tfstate"
      region = "us-east-1"
      dynamodb_table = "ratan-ddb-terraform-backend-5378637678"
    }
}
