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
  universal_tags = {
    Owner       = "DevOpsTeam"
    ManagedBy   = "Terragrunt"
    Project     = path_relative_to_include()
  }
}

generate "universal_tags" {
  path      = "tags.auto.tfvars"
  if_exists = "overwrite"
  contents  = <<EOF
tags = {
  Owner       = "DevOpsTeam"
  ManagedBy   = "Terragrunt"
}
EOF
}

