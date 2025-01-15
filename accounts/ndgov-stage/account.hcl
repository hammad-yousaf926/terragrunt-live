locals {
  account_name = basename(get_terragrunt_dir())
}

inputs = {
  account_id = "160319277176"
  account_name = local.account_name
  Environment = "stage"
}
