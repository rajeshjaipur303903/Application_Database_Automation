Table of Contents
```
Prerequisites
Setting Up the Private Network
Provisioning Remote Machines
Configuring the Application and Database
Apply Final Configuration
```

1. Prerequisites
```
Before starting, ensure you have the following:
AWS Account: Access to an AWS account with the necessary permissions.
Terraform: Installed on your local machine. Installation Guide
AWS CLI: Installed and configured on your local machine. Installation Guide
Key Pair: An existing SSH key pair in your AWS account for accessing EC2 instances.
```

2. Setting Up the Private Network
```
VPC, Subnets, Internet Gateway, Route Tables
```
Mentioned all configuration in `vpc.tf`


3. Provisioning Remote Machines
```
SG, Basbastion host, Web and DB Servers
```
Mentioned all configuration in `instances.tf`

4. Configuring the Application and Database
```
Application Load Balancer (ALB) 
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
