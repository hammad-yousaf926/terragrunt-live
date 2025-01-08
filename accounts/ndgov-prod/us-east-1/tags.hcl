# include "region" {
#   path = find_in_parent_folders("region.hcl")
# }

# include "account" {
#   path = find_in_parent_folders("account.hcl")
# }

# locals {

#   common_tags = {
#     account_id = include.account.locals.account_id
#     account_name = include.account.locals.account_name
#     ManagedBy   = "Terragrunt"
#     Project     = "Terraform Automation"
#     Environment = "production"
#   }
# }

# inputs = {
#   common_tags = locals.common_tags
# }
