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
