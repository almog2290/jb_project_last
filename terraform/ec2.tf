resource "aws_security_group" "ec2_sg" {
  vpc_id = var.create_vpc ? aws_vpc.vpc[0].id : data.aws_vpc.default.id
  
  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.prefix_name}-ec2-sg"
  }
}

resource "aws_instance" "builder_vm" {
  ami           = var.ami 
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = var.associate_public_ip
  key_name = aws_key_pair.builder_key.key_name
  
  subnet_id = var.create_vpc ? aws_subnet.subnet[0].id : data.aws_subnet.default.id

  depends_on = [aws_key_pair.builder_key]

  tags = {
    Name = "${var.prefix_name}-vm"
  }
}

# Generate an SSH key pair
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Save the private key locally
resource "local_file" "private_key" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "${var.ssh_key_path}/builder_key.pem"
  file_permission = "0600"
}

# Create an AWS key pair using the public key
resource "aws_key_pair" "builder_key" {
  key_name   = "builder-key-${var.prefix_name}"
  public_key = tls_private_key.ssh_key.public_key_openssh
}