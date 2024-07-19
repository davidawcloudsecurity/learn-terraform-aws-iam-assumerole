# learn-terraform-aws-iam-assumerole
how to create policy with assume role

# learn-terraform-aws-vpc
```ruby
alias tf="terraform"; alias tfa="terraform apply --auto-approve"; alias tfd="terraform destroy --auto-approve"; alias tfm="terraform init; terraform fmt; terraform validate; terraform plan"
```
## https://developer.hashicorp.com/terraform/install
Install if running at cloudshell
```ruby
sudo yum install -y yum-utils shadow-utils; sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo; sudo yum -y install terraform; terraform init
```

## How to Use Terraform Variables: Examples
tfa -var project_account_id=<project_account_id> -var platform_account_id=<platform_account_id>
```ruby
project_account=$(aws sts get-caller-identity --query Account --output text)
echo $project_account
tfa -var project_account_id=$project_account -var platform_account_id=012987654321 -var 'example_tag={agency="abc", project="gen"}'
```
Extract CIDR
```bash
app_vpc=$(echo $(terraform output application_vpc_id) | sed 's/"//g'); data_vpc=$(echo $(terraform output data_vpc_id) | sed 's/"//g') \
aws ec2 describe-vpcs --vpc-ids $app_vpc --query 'Vpcs[0].CidrBlock'; aws ec2 describe-vpcs --vpc-ids $data_vpc --query 'Vpcs[0].CidrBlock'
```
Resource - https://spacelift.io/blog/how-to-use-terraform-variables#variable-substitution-using-cli-and-tfvars
