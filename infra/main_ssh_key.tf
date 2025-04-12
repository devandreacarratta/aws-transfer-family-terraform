resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_transfer_ssh_key" "transfer_ssh_key" {
  server_id = aws_transfer_server.transfer_server.id
  user_name = aws_transfer_user.transfer_user.user_name
  body      = trimspace(tls_private_key.private_key.public_key_openssh)
}