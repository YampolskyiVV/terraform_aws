# terraform_aws

### Install Terraform
How to install [here](https://www.terraform.io/intro/getting-started/install.html) or step by step 
```
mkdir /opt/terraform && cd /opt/terraform
wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip
unzip terraform_0.11.7_linux_amd64.zip
ln -s /opt/terraform/terraform /usr/bin/terraform
```
### Clone (copy) main.tf
You must replays your AWS credential and expoert environment variable
```
export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)
```
`key_name = "your_key_pair_name"` - Your 'Key Paip Name' used to apply ssh access for new instances 
`private_key = "${file("path_to_your_privat_key.pem")}"` - Path to your privat key
### Spin up instance
Initial terraform once
`terraform init`
Deploy instance
```
terraform plan
terraform apply
```

### To Do
Deploy elb etc.
