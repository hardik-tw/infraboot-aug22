# Hands-on exercise 

- Create an EC2 Instance and install Apache web server in EC2 instance using terraform and user data scripts.- 
- Use below configurations:
- EC2 Configurations:  
  Instance Type : t2.micro  
  Instance AMI id: Amazon Linux (latest)  
  VPC - default VPC  
  Public Subnet - any default subnet 
- Create a Security Group with below inbound rule and use that SG for your ec2 resource
- EC2 instance must have ssh access(port 22) and access on port 80 only to your Public IP and should restrict access to Public.  
- Do not keep it open to the internet i.e 0.0.0.0/0

## Ask: 
1. Two Resources to be created - ec2 and SG 
2. Output ec2 public ip 
3. use varialbe and separate the .tf files
4. explore option to have ami-id with data and filter (instead of hard-code)
5. explore and do ebs volume encryption 
