provider "aws" {
  region = "ap-southeast-1"
}

# Please check if this matches your platform-policy-new1.json
resource "aws_iam_policy" "platform_policy_new_01" {
  name        = "policy-1"
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
        "Resource": "arn:aws:ec2:ap-southeast-1:${var.project_account_id}:*/*"
      },
      {
        "Action": [
          "codecommit:*"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:codecommit:ap-southeast-1:${var.project_account_id}:*"
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

resource "aws_iam_policy" "platform_policy_sample_02" {
  name        = "policy-2"
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
        "Resource": "arn:aws:elasticache:ap-southeast-1:${var.project_account_id}:cluster:*"
      },
      {
        "Action": [
          "rds:DescribeDBClusters"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:rds:ap-southeast-1:${var.project_account_id}:cluster:*"
      },
      {
        "Action": [
          "rds:DescribeGlobalClusters"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:rds::${var.project_account_id}:global-cluster:*"
      },
      {
        "Action": [
          "rds:CreateDBInstance"
        ],
        "Effect": "Allow",
        "Resource": [
          "arn:aws:rds:ap-southeast-1:${var.project_account_id}:db:*",
          "arn:aws:rds:ap-southeast-1:${var.project_account_id}:subgrp:*"
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
        "Resource": "arn:aws:lambda:ap-southeast-1:${var.project_account_id}:function:*"
      },
      {
        "Action": [
          "rds:DescribeDBInstances"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:rds:ap-southeast-1:${var.project_account_id}:db:*"
      },
      {
        "Action": [
          "eks:CreateFargateProfile"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:eks:ap-southeast-1:${var.project_account_id}:cluster/*"
      },
      {
        "Action": [
          "eks:DescribeFargateProfile"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:eks:ap-southeast-1:${var.project_account_id}:fargateprofile/*/platform_service/*"
      },
      {
        "Action": [
          "eks:DescribeFargateProfile"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:eks:ap-southeast-1:${var.project_account_id}:fargateprofile/*/kube-system/*"
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

# Please check if this matches your platform-policy-sample-3.json

resource "aws_iam_policy" "platform_policy_sample_03" {
  name        = "policy-3"
  description = "Example IAM Policy"
  policy      = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "rds:CreateDBCluster"
        ],
        "Effect": "Allow",
        "Resource": [
          "arn:aws:rds:ap-southeast-1:${var.project_account_id}:cluster-pg:*",
          "arn:aws:rds:ap-southeast-1:${var.project_account_id}:cluster:*",
          "arn:aws:rds:ap-southeast-1:${var.project_account_id}:og:*",
          "arn:aws:rds:ap-southeast-1:${var.project_account_id}:subgrp:*"
        ]
      },
      {
        "Sid": "AllowRunInstance",
        "Action": [
          "ec2:RunInstances"
        ],
        "Effect": "Allow",
        "Resource": [
          "arn:aws:ec2:ap-southeast-1:${var.project_account_id}:instance/*",
          "arn:aws:ec2:ap-southeast-1:${var.project_account_id}:key-pair/*",
          "arn:aws:ec2:ap-southeast-1:${var.project_account_id}:network-interface/*",
          "arn:aws:ec2:ap-southeast-1:${var.project_account_id}:security-group/*",
          "arn:aws:ec2:ap-southeast-1:${var.project_account_id}:subnet/*",
          "arn:aws:ec2:ap-southeast-1:${var.project_account_id}:volume/*",
          "arn:aws:ec2:ap-southeast-1::image/*"
        ]
      },
      {
        "Action": [
          "eks:DescribeCluster"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:eks:ap-southeast-1:${var.project_account_id}:cluster/*"
      },
      {
        "Action": [
          "transfer:*"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:transfer:ap-southeast-1:${var.project_account_id}:server/*"
      }
    ]
  })
}

# Please check if this matches your platform-policy-sample-4.json
resource "aws_iam_policy" "platform_policy_sample_04" {
  name        = "policy-4"
  description = "Example IAM Policy"
  policy      = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "ram:*",
          "events:*",
          "codeartifact:*"
        ],
        "Effect": "Allow",
        "Resource": "*"
      },
      {
        "Action": [
          "elasticache:AddTagsToResource",
          "elasticache:CreateCacheSubnetGroup",
          "elasticache:CreateCacheCluster",
          "elasticache:DescribeCacheSubnetGroups"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:elasticache:ap-southeast-1:${var.project_account_id}:*:*"
      },
      {
        "Action": [
          "rds:CreateDBSubnetGroup",
          "rds:DescribeDBSubnetGroups",
          "rds:ListTagsForResource"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:rds:ap-southeast-1:${var.project_account_id}:subgrp:*"
      }
    ]
  })
}

resource "aws_iam_role" "project_trust_platform" {
  name = "project-trust-platform-role"
  force_detach_policies = true
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "AWS": "arn:aws:iam::${var.platform_account_id}:root"  # Replace YOUR_OTHER_ACCOUNT_ID with the ID of the other AWS account
        },
        "Action": "sts:AssumeRole"
      },
      {
        "Effect": "Allow",
        "Principal": {
          "AWS": "arn:aws:iam::${var.project_account_id}:root"  # Replace YOUR_OTHER_ACCOUNT_ID with the ID of the other AWS account
        },
        "Action": "sts:AssumeRole"
      },
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "codebuild.amazonaws.com"  # Replace YOUR_OTHER_ACCOUNT_ID with the ID of the other AWS account
        },
        "Action": "sts:AssumeRole"
      },
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "codepipeline.amazonaws.com"  # Replace YOUR_OTHER_ACCOUNT_ID with the ID of the other AWS account
        },
        "Action": "sts:AssumeRole"
      }
    ]
  })
tags = var.example_tag
}

resource "aws_iam_policy_attachment" "attach_example_policy_01" {
  name       = "example_policy_attachment_01"
  roles      = [aws_iam_role.project_trust_platform.name]
  policy_arn = aws_iam_policy.platform_policy_new_01.arn
}

resource "aws_iam_policy_attachment" "attach_example_policy_02" {
  name       = "example_policy_attachment_02"
  roles      = [aws_iam_role.project_trust_platform.name]
  policy_arn = aws_iam_policy.platform_policy_sample_02.arn
}

resource "aws_iam_policy_attachment" "attach_example_policy_03" {
  name       = "example_policy_attachment_03"
  roles      = [aws_iam_role.project_trust_platform.name]
  policy_arn = aws_iam_policy.platform_policy_sample_03.arn
}

resource "aws_iam_policy_attachment" "attach_example_policy_04" {
  name       = "example_policy_attachment_04"
  roles      = [aws_iam_role.project_trust_platform.name]
  policy_arn = aws_iam_policy.platform_policy_sample_04.arn
}

resource "aws_iam_policy_attachment" "attach_awsquicksightlistiam" {
  name       = "project-trust-platform-role"
  roles      = [aws_iam_role.project_trust_platform.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSQuickSightListIAM"
}

# Attach the AWSResourceAccessManagerResourceShareParticipantAccess policy to the IAM role
resource "aws_iam_role_policy_attachment" "attach-ram" {
  role       = aws_iam_role.project_trust_platform.name
  policy_arn = "arn:aws:iam::aws:policy/AWSResourceAccessManagerResourceShareParticipantAccess"
}

# Attach the PowerUserAccess policy to the IAM role
resource "aws_iam_role_policy_attachment" "attach-power-user" {
  role       = aws_iam_role.project_trust_platform.name
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

# Attach the SecretsManagerReadWrite policy to the IAM role
resource "aws_iam_role_policy_attachment" "attach-secrets-manager" {
  role       = aws_iam_role.project_trust_platform.name
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}

data "aws_caller_identity" "current" {}

output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "iam_role_arn" {
  value = aws_iam_role.project_trust_platform.arn
}

data "aws_vpcs" "application_vpcs" {
  filter {
    name   = "tag:Name"
    values = ["application-vpc"]  # Replace with the name of your application VPC
  }
}

data "aws_vpcs" "data_vpcs" {
  filter {
    name   = "tag:Name"
    values = ["data-vpc"]  # Replace with the name of your data VPC
  }
}

output "application_vpc_id" {
  value = data.aws_vpcs.application_vpcs.ids[0]  # Assuming there's only one VPC with this name
}

output "application_vpc_cidr_block" {
  value = data.aws_vpcs.application_vpcs.cidr_block
}

output "data_vpc_id" {
  value = data.aws_vpcs.data_vpcs.ids[0]  # Assuming there's only one VPC with this name
}

output "data_vpc_cidr_block" {
  value = data.aws_vpcs.data_vpcs.ids[0] != null ? element(data.aws_vpcs.data_vpcs.cidr_blocks, 0) : null
}
