provider "aws" {
  region = var.aws_region
}

data "aws_iam_policy" "policy-1" {
  arn = "arn:aws:iam::${var.project_account_id}:policy/policy-1"
}

data "aws_iam_policy" "policy-2" {
  arn = "arn:aws:iam::${var.project_account_id}:policy/policy-2"
}

data "aws_iam_policy" "policy-3" {
  arn = "arn:aws:iam::${var.project_account_id}:policy/policy-3"
}

data "aws_iam_policy" "policy-4" {
  arn = "arn:aws:iam::${var.project_account_id}:policy/policy-4"
}

resource "aws_iam_role" "project_trust_platform" {
  name = var.project_iam_role
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
  policy_arn = data.aws_iam_policy.policy-1.arn
}

resource "aws_iam_policy_attachment" "attach_example_policy_02" {
  name       = "example_policy_attachment_02"
  roles      = [aws_iam_role.project_trust_platform.name]
  policy_arn = data.aws_iam_policy.policy-2.arn
}

resource "aws_iam_policy_attachment" "attach_example_policy_03" {
  name       = "example_policy_attachment_03"
  roles      = [aws_iam_role.project_trust_platform.name]
  policy_arn = data.aws_iam_policy.policy-3.arn
}

resource "aws_iam_policy_attachment" "attach_example_policy_04" {
  name       = "example_policy_attachment_04"
  roles      = [aws_iam_role.project_trust_platform.name]
  policy_arn = data.aws_iam_policy.policy-4.arn
}

resource "aws_iam_policy_attachment" "attach_awsquicksightlistiam" {
  name       = var.project_iam_role
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
