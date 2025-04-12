resource "aws_iam_role" "transfer_role" {
  name = "IAM-TransferFamilyAccessRole-${random_pet.pet.id}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "transfer.amazonaws.com"
        }
        Effect = "Allow"
      }
    ]
  })

  tags = local.common_tags
}

resource "aws_iam_role_policy" "transfer_policy" {
  name = "IAM-TransferAccessS3-${random_pet.pet.id}"
  role = aws_iam_role.transfer_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid : "AllowListBucket",
        Effect : "Allow",
        Action : ["s3:ListBucket"],
        Resource : aws_s3_bucket.s3_bucket.arn,
      },
      {
        Sid : "AllowS3ActionsInFolder",
        Effect : "Allow",
        Action : ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"],
        Resource : [
          "${aws_s3_bucket.s3_bucket.arn}/${local.s3_bucket_path_upload}/",
          "${aws_s3_bucket.s3_bucket.arn}/${local.s3_bucket_path_upload}/*",
        ]
      }
    ]
  })
}