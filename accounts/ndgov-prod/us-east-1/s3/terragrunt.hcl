terraform {
  source = "git::https://github.com/hammad-yousaf926/terraform-modules.git//modules/s3/?ref=main"
}

include "region" {
  path = "${find_in_parent_folders("region.hcl")}"
}

include "account" {
  path = "${find_in_parent_folders("account.hcl")}"
}

# include "tags" {
#   path = "${find_in_parent_folders("tags.hcl")}"
# }

inputs = {
  bucket_name     = "my-unique-buckedfssdfertgdfft-namedfgdfg"
  acl             = "private"
  versioning      = true
  tags = {
    Terraform   = "true"
    Environment = "production"
  }    
  
}