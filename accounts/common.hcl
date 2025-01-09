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
  # Extracting parts of the path for dynamic tags
  parsed_path = split("/", path_relative_to_include())

  universal_tags = {
    Owner       = "DevOpsTeam"
    ManagedBy   = "Terragrunt"
    Account     = local.parsed_path[1]               # Extract account name (e.g., ndgov-prod)
    Region      = replace(local.parsed_path[2], "1", "-1") # Fix region format (e.g., us-east-1)
    Project     = join("/", local.parsed_path)       # Full project path
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




