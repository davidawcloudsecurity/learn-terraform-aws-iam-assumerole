provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_iam_policy" "example_policy" {
  name        = "example_policy"
  description = "Example IAM Policy"
  policy      = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "sts:AssumeRole",
          "sts:GetCallerIdentity",
          "s3:ListBucket",
          "kms:*",
          "rds:*",
          "elasticloadbalancing:*",
          "eks:*",
          "transfer:CreateServer",
          "dynamodb:PutItem",
          "dynamodb:GetItem",
          "dynamodb:DeleteItem",
          "iam:*",
          "s3:*",
          "codepipeline:*",
          "codecommit:*",
          "codebuild:*",
          "sagemaker:*",
          "cognito-idp:*",
          "application-autoscaling:*",
          "elasticache:*",
          "logs:*",
          "ecr:*"
        ],
        "Effect": "Allow",
        "Resource": "*"
      },
      {
        "Sid": "AllowEC2",
        "Action": [
          "ec2:AuthorizeSecurityGroup*",
          "ec2:AllocateAddress",
          "ec2:AssociateAddress",
          "ec2:AssociateRouteTable",
          "ec2:AttachInternetGateway",
          "ec2:Create*",
          "ec2:Describe*",
          "ec2:ImportKeyPair",
          "ec2:ModifySubnetAttribute",
          "ec2:RevokeSecurityGroup*"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:ec2:ap-southeast-1:var.account_id:*/*"
      },
      {
        "Action": [
          "codecommit:*"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:codecommit:ap-southeast-1:var.account_id:*"
      },
      {
        "Action": [
          "s3:CreateBucket",
          "s3:ListBucket",
          "s3:PutBucketVersioning",
          "s3:GetBucketPolicy",
          "s3:GetBucketAcl",
          "s3:GetBucketCORS",
          "s3:GetBucketWebsite",
          "s3:GetBucketVersioning",
          "s3:GetAccelerateConfiguration",
          "s3:GetBucketRequestPayment",
          "s3:GetBucketLogging",
          "s3:GetLifecycleConfiguration",
          "s3:GetReplicationConfiguration",
          "s3:GetEncryptionConfiguration",
          "s3:GetBucketObjectLockConfiguration",
          "s3:GetBucketTagging",
          "s3:PutBucketNotification"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:s3:::*"
      }
    ]
  })
}
