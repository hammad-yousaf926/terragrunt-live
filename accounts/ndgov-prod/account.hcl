# include "root" {
#   path = find_in_parent_folders("common.hcl")
# }

locals {
  # Extract the account name from the directory structure
  account_name = basename(get_terragrunt_dir())
}

inputs = {
  account_id = "160319277176"
  account_name = local.account_name
}
