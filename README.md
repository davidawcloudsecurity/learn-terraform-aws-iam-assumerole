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
tfa -var project_account_id=$project_account -var platform_account_id=012987654321
```
Resource - https://spacelift.io/blog/how-to-use-terraform-variables#variable-substitution-using-cli-and-tfvars
