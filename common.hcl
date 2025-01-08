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

generate = {
  path      = "${path_relative_to_include()}"
  file_name = "terragrunt.hcl"
}
