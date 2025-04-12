resource "random_pet" "pet" {
  length = 1
}


resource "random_string" "username" {
  length  = 8
  upper   = false
  special = false
}
