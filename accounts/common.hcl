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

locals {
  # Extract account name and region from the directory structure
  directory_parts = split("/", path_relative_to_include())
  account_name    = local.directory_parts[0] # Extracts "ndgov-prod" from "accounts/ndgov-prod/us-east-1/s3"
  region          = local.directory_parts[1] # Extracts "us-east-1" from "accounts/ndgov-prod/us-east-1/s3"

  # Define universal tags
  universal_tags = {
    Owner       = "DevOpsTeam"
    ManagedBy   = "Terragrunt"
    Project     = path_relative_to_include()
    Account     = local.account_name
    Region      = local.region
  }
}

terraform {
  extra_arguments "universal_tags" {
    commands = ["plan", "apply"]

    arguments = [
      "-var",
      "tags=${jsonencode(local.universal_tags)}"
    ]
  }
}





