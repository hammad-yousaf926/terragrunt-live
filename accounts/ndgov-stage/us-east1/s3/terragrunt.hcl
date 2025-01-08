include "account" {
  path = "${find_in_parent_folders("account.hcl")}"
}

# include "root" {
#   path = find_in_parent_folders("common.hcl")
# }

inputs = {
  bucket_name     = "my-unique-buckett-hammad"
  acl             = "private"
  versioning      = true
  tags = {
    Terraform   = "true"
    Environment = "production"
    team = "stage"
  } 

}