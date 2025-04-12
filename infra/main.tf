provider "aws" {
  region = "eu-south-1"
}

locals {
  common_tags = {
    Project          = "aws-transfer"
    organizationName = local.organization_name
    Name             = random_pet.pet.id
  }
  organization_name            = "devandreacarratta-it"
  bucket_name                  = "transfer-server-${random_pet.pet.id}-bucket"
  s3_bucket_path_upload        = "uploads"
  s3_bucket_path_ssh           = "ssh"
  s3_bucket_path_ftp_connector = "ftp-connector"
  s3_file_id_rsa               = "id_rsa_${random_string.username.result}.pem"
}
