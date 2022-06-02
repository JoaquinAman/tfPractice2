resource "aws_vpc" "VPC_with_Terraform_joaquin_aman" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "VPC_with_Terraform_joaquin_aman"
  }
}

resource "aws_subnet" "public_subnet1_with_tf_joaquin_aman" {
  vpc_id     = aws_vpc.VPC_with_Terraform_joaquin_aman.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public_subnet1_with_tf_joaquin_aman"
  }
}

resource "aws_subnet" "private_subnet2_with_tf_joaquin_aman" {
  vpc_id     = aws_vpc.VPC_with_Terraform_joaquin_aman.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private_subnet2_with_tf_joaquin_aman"
  }
}

resource "aws_subnet" "private_subnet3_with_tf_joaquin_aman" {
  vpc_id     = aws_vpc.VPC_with_Terraform_joaquin_aman.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "private_subnet3_with_tf_joaquin_aman"
  }
}

resource "aws_internet_gateway" "igw_with_terraform_joaquin_aman" {
  vpc_id = aws_vpc.VPC_with_Terraform_joaquin_aman.id

  tags = {
    Name = "igw_with_terraform_joaquin_aman"
  }
}

resource "aws_route_table" "rt_with_terraform_joaquin_aman" {
  vpc_id = aws_vpc.VPC_with_Terraform_joaquin_aman.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_with_terraform_joaquin_aman.id
  }

  # route {
  #   ipv6_cidr_block        = "::/0"
  #   egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
  # }

  tags = {
    Name = "rt_with_terraform_joaquin_aman"
  }
}

resource "aws_route_table_association" "rt_assoc_igw_with_terraform_joaquin_aman" {
  subnet_id      = aws_subnet.public_subnet1_with_tf_joaquin_aman.id
  route_table_id = aws_route_table.rt_with_terraform_joaquin_aman.id
}