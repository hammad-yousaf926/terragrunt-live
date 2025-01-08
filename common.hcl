locals {
  # Define account IDs for each environment
  account_id_map = {
    "ndgov-prod"  = "160319277176"
    "ndgov-stage" = "222222222222"
  }
}


remote_state {
  backend = "s3"
  config = {
    bucket         = "my-terraform-state-ntdocsss"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}

