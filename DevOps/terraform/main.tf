provider "aws" {
  region = "us-east-1"
}

# -----------------------------
# VPC
# -----------------------------
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main-vpc"
  }
}


# -----------------------------
# Internet Gateway
# -----------------------------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}

# -----------------------------
# Public Subnet
# -----------------------------
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "public-subnet"
  }
}


# -----------------------------
# Public Route Table
# -----------------------------
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

# -----------------------------
# Associate Route Table to Subnet
# -----------------------------
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

/*
# -----------------------------
# Private Subnet
# -----------------------------
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  map_public_ip_on_launch = false   # <-- Important!

  tags = {
    Name = "private-subnet"
  }
}
*/

# Create a security group that allows SSH
resource "aws_security_group" "ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # open to world (not recommended for production)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "my_ec2" {
  ami           = "ami-0cae6d6fe6048ca2c" # Amazon Linux 2023 AMI 2023.9.20251110.1 x86_64 HVM kernel-6.1
  instance_type = "t3.micro"
  subnet_id = aws_subnet.public.id # specify which subnet the ec2 will be created in
#  subnet_id = aws_subnet.private.id 
  key_name = "my-key-pair"   # <-- must exist in AWS EC2 prior to running this (EC2 > Key Pairs)
  vpc_security_group_ids = [aws_security_group.ssh.id]

  tags = {
    Name = "MyTerraformEC2"
  }
}

















