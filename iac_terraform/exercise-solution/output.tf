output "instance_ip" {
    value = aws_instance.first_ec2_with_terraform.public_ip
}