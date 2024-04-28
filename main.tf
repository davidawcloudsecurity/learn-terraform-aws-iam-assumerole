provider "aws" {
  region = "ap-southeast-1"
}

# Please check if this match your platform-policy-new1.json
resource "aws_iam_policy" "platform_policy_new1" {
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
        "Resource": "arn:aws:ec2:ap-southeast-1:${var.aws_account_id}:*/*"
      },
      {
        "Action": [
          "codecommit:*"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:codecommit:ap-southeast-1:${var.aws_account_id}:*"
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

resource "aws_iam_policy" "platform_policy_sample_2" {
  name        = "example_policy"
  description = "Example IAM Policy"
  policy      = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "transfer:*",
          "dynamodb:*"
        ],
        "Effect": "Allow",
        "Resource": "*"
      },
      {
        "Action": [
          "elasticache:DescribeCacheClusters",
          "elasticache:ListTagsForResource"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:elasticache:ap-southeast-1:${var.aws_account_id}:cluster:*"
      },
      {
        "Action": [
          "rds:DescribeDBClusters"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:rds:ap-southeast-1:${var.aws_account_id}:cluster:*"
      },
      {
        "Action": [
          "rds:DescribeGlobalClusters"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:rds::${var.aws_account_id}:global-cluster:*"
      },
      {
        "Action": [
          "rds:CreateDBInstance"
        ],
        "Effect": "Allow",
        "Resource": [
          "arn:aws:rds:ap-southeast-1:${var.aws_account_id}:db:*",
          "arn:aws:rds:ap-southeast-1:${var.aws_account_id}:subgrp:*"
        ]
      },
      {
        "Action": [
          "lambda:CreateFunction",
          "lambda:GetFunction",
          "lambda:ListVersionsByFunction",
          "lambda:GetFunctionCodeSigningConfig",
          "lambda:AddPermission",
          "lambda:GetPolicy"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:lambda:ap-southeast-1:${var.aws_account_id}:function:*"
      },
      {
        "Action": [
          "rds:DescribeDBInstances"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:rds:ap-southeast-1:${var.aws_account_id}:db:*"
      },
      {
        "Action": [
          "eks:CreateFargateProfile"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:eks:ap-southeast-1:${var.aws_account_id}:cluster/*"
      },
      {
        "Action": [
          "eks:DescribeFargateProfile"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:eks:ap-southeast-1:${var.aws_account_id}:fargateprofile/*/platform_service/*"
      },
      {
        "Action": [
          "eks:DescribeFargateProfile"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:eks:ap-southeast-1:${var.aws_account_id}:fargateprofile/*/kube-system/*"
      },
      {
        "Action": [
          "secretsmanager:*",
          "cloudformation:Create*",
          "cloudformation:Describe*",
          "cloudformation:Delete*",
          "cloudformation:ExecuteChangeSet"
        ],
        "Effect": "Allow",
        "Resource": "*"
      },
      {
        "Action": [
          "cloudwatch:PutMetricData",
          "ds:CreateComputer",
          "ds:DescribeDirectories",
          "logs:*",
          "ssm:*",
          "ec2messages:*",
          "ecr-public:*",
          "sts:*"
        ],
        "Effect": "Allow",
        "Resource": "*"
      },
      {
        "Action": "iam:CreateServiceLinkedRole",
        "Condition": {
          "StringLike": {
            "iam:AWSServiceName": "ssm.amazonaws.com"
          }
        },
        "Effect": "Allow",
        "Resource": "arn:aws:iam::*:role/aws-service-role/ssm.amazonaws.com/AWSServiceRoleForAmazonSSM*"
      },
      {
        "Action": [
          "iam:DeleteServiceLinkedRole",
          "iam:GetServiceLinkedRoleDeletionStatus"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:iam::*:role/aws-service-role/ssm.amazonaws.com/AWSServiceRoleForAmazonSSM*"
      },
      {
        "Action": [
          "ssmmessages:CreateControlChannel",
          "ssmmessages:CreateDataChannel",
          "ssmmessages:OpenControlChannel",
          "ssmmessages:OpenDataChannel"
        ],
        "Effect": "Allow",
        "Resource": "*"
      }
    ]
  })
}
