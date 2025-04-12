locals {
  s3_folders = [
    local.s3_bucket_path_upload,
    local.s3_bucket_path_ssh,
    local.s3_bucket_path_ftp_connector,
  ]
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = local.bucket_name
  tags   = local.common_tags
}

resource "aws_s3_object" "s3_folder" {
  for_each = toset(local.s3_folders)
  bucket   = aws_s3_bucket.s3_bucket.id
  key      = "${each.key}/"
  source   = ""
}

resource "aws_s3_object" "s3_object_public_key_file" {
  depends_on = [aws_s3_object.s3_folder]
  bucket     = aws_s3_bucket.s3_bucket.id
  key        = "${local.s3_bucket_path_ssh}/id_rsa.pub"
  content    = trimspace(tls_private_key.private_key.public_key_openssh)
}

resource "aws_s3_object" "s3_object_private_key_file" {
  depends_on = [aws_s3_object.s3_folder]
  bucket     = aws_s3_bucket.s3_bucket.id
  key        = "${local.s3_bucket_path_ssh}/${local.s3_file_id_rsa}"
  content    = tls_private_key.private_key.private_key_pem
}