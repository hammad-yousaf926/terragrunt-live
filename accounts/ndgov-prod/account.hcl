include "root" {
  path = find_in_parent_folders("common.hcl")
}

locals {
  # Extract the account name from the directory structure
  account_name = basename(get_terragrunt_dir())
  account_id   = lookup(local.account_id_map, local.account_name, "000000000000")
}

inputs = {
  account_id = local.account_id
  account_name = local.account_name
}
