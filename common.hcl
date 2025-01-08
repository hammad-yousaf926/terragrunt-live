locals {
  # Define account IDs for each environment
  account_id_map = {
    "ndgov-prod"  = "160319277176"
    "ndgov-stage" = "222222222222"
  }
    bucket_prefix      = "my-terraform-state-ntdocsss"
    dynamodb_prefix    = "terraform-lock"
    }

    terraform {
    extra_arguments "backend_config" {
        commands = ["init"]

        arguments = [
        "-backend-config=bucket=${local.bucket_prefix}-${include.account.locals.account_id}",
        "-backend-config=key=${path_relative_to_include()}/terraform.tfstate",
        "-backend-config=region=${include.region.locals.region}",
        "-backend-config=dynamodb_table=${local.dynamodb_prefix}-${include.account.locals.account_id}"
        ]
    }
}
