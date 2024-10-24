resource "aws_s3_bucket" "tf-backend" {
  bucket = var.backend_bucket
}

resource "aws_s3_bucket" "tf-management-trail" {
  bucket        = "tf-management-trail"
  force_destroy = true

}

resource "aws_s3_bucket_logging" "tf-backend-logging" {
  bucket        = aws_s3_bucket.tf-management-trail.id
  target_bucket = aws_s3_bucket.tf-backend.id
  target_prefix = "log/"
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
            "arn:aws:iam::${var.aws_account_number}:user/${var.user_name}",
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

resource "aws_s3_bucket_policy" "tf-management-trail-policy" {
  bucket = aws_s3_bucket.tf-management-trail.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AWSCloudTrailAclCheck",
        Effect = "Allow",
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        },
        Resource = aws_s3_bucket.tf-management-trail.arn
        Action   = "s3:GetBucketAcl"
      },
      {
        Sid    = "AWSCloudTrailWrite",
        Effect = "Allow",
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        },
        Action   = "s3:PutObject",
        Resource = "${aws_s3_bucket.tf-management-trail.arn}/management/AWSLogs/${var.aws_account_number}/*",
        Condition = {
          StringEquals = {
            "s3:x-amz-acl" : "bucket-owner-full-control"
          }
        }
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
