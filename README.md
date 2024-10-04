# learn-terraform-aws-iam-assumerole
how to create policy with assume role

## https://developer.hashicorp.com/terraform/install
Install if running at cloudshell
```ruby
alias k=kubectl; alias tf="terraform"; alias tfa="terraform apply --auto-approve"; alias tfd="terraform destroy --auto-approve"; alias tfm="terraform init; terraform fmt; terraform validate; terraform plan"; sudo yum install -y yum-utils shadow-utils; sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo; sudo yum -y install terraform;
```

## How to Use Terraform Variables: Examples
tfa -var project_account_id=<project_account_id> -var platform_account_id=<platform_account_id>
```ruby
project_account=$(aws sts get-caller-identity --query Account --output text); \
platform_account="";\
example_role=""; \
echo "project: $project_account"; \
echo "platform: $platform_account"; \
echo "assumeRole: $example_role"
```
```ruby
tfa -var project_account_id=$project_account -var platform_account_id=$platform_account -var 'example_tag={agency="abc", project="gen"}' -var 'project_iam_role=$example_role'
```
Extract CIDR
```bash
app_vpc=$(echo $(terraform output application_vpc_id) | sed 's/"//g'); data_vpc=$(echo $(terraform output data_vpc_id) | sed 's/"//g') \
echo "app cidr: $(echo $(aws ec2 describe-vpcs --vpc-ids $app_vpc --query 'Vpcs[0].CidrBlock') | sed 's/"//g')"; echo "data cidr: $(echo $(aws ec2 describe-vpcs --vpc-ids $data_vpc --query 'Vpcs[0].CidrBlock') | sed 's/"//g')"
```
Resource - https://spacelift.io/blog/how-to-use-terraform-variables#variable-substitution-using-cli-and-tfvars
