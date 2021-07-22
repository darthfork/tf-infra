resource "aws_s3_bucket" "tf-backend" {
  bucket = "tf-backend-abhishek"
}

resource "aws_s3_bucket_policy" "tf-backend-policy" {
  bucket = aws_s3_bucket.tf-backend.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:ListBucket",
        Resource  = aws_s3_bucket.tf-backend.arn
      },
      {
        Effect = "Allow",
        Principal = {
          "AWS" : [
            "arn:aws:iam::${var.aws_account_number}:user/arai",
            "arn:aws:iam::${var.aws_account_number}:root"
          ]
        },
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ],
        Resource = "${aws_s3_bucket.tf-backend.arn}/terraform/terraform.tfstate"
      }
    ]
  })
}

resource "aws_s3_bucket_public_access_block" "tf-backend-public-access-block" {
  bucket = aws_s3_bucket.tf-backend.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
