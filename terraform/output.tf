output "vpc_subnet_info" {
 value = var.create_vpc ? "The following is your VPC: ${aws_vpc.vpc[0].id} and Subnet: ${aws_subnet.subnet[0].id}" : "Using default VPC (${data.aws_vpc.default.id}) and Subnet (${data.aws_subnet.default.id})"
 description = "values of VPC and Subnet"
}

output "internet_gateway_id" {
  value = length(data.aws_internet_gateway.existing_igw.id) == 0 ? aws_internet_gateway.igw[0].id : data.aws_internet_gateway.existing_igw.id
  description = "The ID of the Internet Gateway"
}

output "route_table_id" {
  value       = aws_route_table.public_rt.id
  description = "The ID of the public route table"
}

output "ec2_instance_public_ip" {
  value       = aws_instance.builder_vm.public_ip
  description = "The public IP address of the EC2 instance"
}

# Output the necessary details
output "ssh_private_key_path" {
  value       = local_file.private_key.filename
  description = "Path to the generated private SSH key"
  sensitive   = true
}

output "ssh_key_name" {
  value       = aws_key_pair.builder_key.key_name
  description = "Name of the AWS SSH key pair"
}