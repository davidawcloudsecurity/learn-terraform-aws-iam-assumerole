```bash
this_account=$(aws sts get-caller-identity --query Account --output text)
cluster_name=$(aws eks list-clusters --query clusters --output text)
get_region=$(aws ec2 describe-availability-zones --output text --query 'AvailabilityZones[0].[RegionName]')
CREDENTIALS=$(aws sts assume-role --role-arn arn:aws:iam::$this_account:role/project-trust-platform-role --role-session-name "AssumeRoleSession")
export AWS_ACCESS_KEY_ID=$(echo $CREDENTIALS | jq -r '.Credentials.AccessKeyId')
export AWS_SESSION_TOKEN=$(echo $CREDENTIALS | jq -r '.Credentials.SessionToken')
export AWS_SECRET_ACCESS_KEY=$(echo $CREDENTIALS | jq -r '.Credentials.SecretAccessKey')
aws configure --profile assume_role set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure --profile assume_role set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure --profile assume_role set aws_session_token $AWS_SESSION_TOKEN
aws configure --profile assume_role get region
aws --profile assume_role  eks update-kubeconfig --region $get_region --name $cluster_name
```
