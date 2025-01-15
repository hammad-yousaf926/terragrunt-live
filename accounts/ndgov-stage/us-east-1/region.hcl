locals {
  # Extract the region name from the directory structure
  region = basename(get_parent_terragrunt_dir())
}

inputs = {
  region = local.region
}
