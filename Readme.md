Table of Contents
Prerequisites:- 
```
Setting Up the Private Network
Provisioning Remote Machines
Configuring the Application and Database
Apply Final Configuration
```

1. Prerequisites

Before starting, ensure you have the following:-

- AWS Account: Access to an AWS account with the necessary permissions.

- Terraform: Installed on your local machine. 
  - Installation Guide for terraform:-
```
  https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
```

- AWS CLI: Installed and configured on your local machine.
  - Installation Guide for AWS CLI:-
```
  https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
```
- Key Pair: An existing SSH key pair in your AWS account for accessing EC2 instances.


2. Setting Up the Private Network
```
Create VPC, Subnets, Internet Gateway, Route Tables 
```
Mentioned all configuration in `vpc.tf`


3. Provisioning Remote Machines
```
Create SG, Basbastion host, Web and DB Servers
```
Mentioned all configuration in `instances.tf`

4. Configuring the Application and Database
```
Create Application Load Balancer (ALB) , Target Group 
```
Mentioned all configuration in `alb.tf`
```
Configure DNS (Route 53)
```
Mentioned all configuration in `route53.tf`

5. Apply Final Configuration
```
terraform init
terraform plan
terraform apply
```
