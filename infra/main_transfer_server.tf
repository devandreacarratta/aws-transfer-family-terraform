resource "aws_transfer_server" "transfer_server" {
  identity_provider_type = "SERVICE_MANAGED"
  protocols              = ["SFTP"]
  endpoint_type          = "PUBLIC"

  tags = local.common_tags
}

resource "aws_transfer_user" "transfer_user" {
  server_id      = aws_transfer_server.transfer_server.id
  user_name      = random_string.username.result
  role           = aws_iam_role.transfer_role.arn
  home_directory = "/${aws_s3_bucket.s3_bucket.bucket}/${local.s3_bucket_path_upload}"
  tags           = local.common_tags
}