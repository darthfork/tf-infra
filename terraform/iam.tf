resource "aws_kms_key" "encryption_key" {
  description = "KMS key for encryption"
  tags = {
    Name = "Default encryption key"
  }
}

resource "aws_iam_role" "github_oidc_role" {
  name = "github_oidc_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity",
        Effect = "Allow",
        Sid    = "",
        Principal = {
          Federated = "arn:aws:iam::${var.aws_account_number}:oidc-provider/token.actions.githubusercontent.com"
        },
        Condition = {
          StringLike = {
            "token.actions.githubusercontent.com:sub": [
              "repo:darthfork/tf-infra:*"
            ]
          },
          StringEquals = {
            "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
          }
        },
      },
    ]
  })
}

resource "aws_iam_policy" "github_oidc_policy" {
  name = "github_oidc_policy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "secretsmanager:GetSecretValue",
          "sts:AssumeRole",
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObjectVersion",
          "s3:ListBucket",
          "s3:DeleteObject",
          "s3:PutObjectAcl"
        ],
        Resource = ["*"]
      },
    ]
  })

}

resource "aws_iam_role" "dev_instance_role" {
  name = "dev_instance_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Sid    = "",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "secrets_manager_policy_attachment" {
  role       = aws_iam_role.dev_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}

resource "aws_iam_role_policy_attachment" "s3_policy_attachment" {
  role       = aws_iam_role.dev_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
