provider "aws" {
  region  = "ap-south-1"
  profile = "terraform"

}
# VPC
resource "aws_vpc" "myvpc" {
  cidr_block = var.mycidr
  tags = {
    Name = var.myvpc_tags
  }
}
# Subnet

resource "aws_subnet" "mysubnet01" {
  cidr_block = var.mysubnet01cidr
  vpc_id     = aws_vpc.myvpc.id
  depends_on = [aws_vpc.myvpc]
}

# Subnet 2

resource "aws_subnet" "mysubnet02" {
  cidr_block = var.mysubnet02cidr
  vpc_id     = aws_vpc.myvpc.id
  depends_on = [aws_vpc.myvpc]
}

# Instance

resource "aws_instance" "myinstance" {

  ami           = var.myami
  instance_type = var.myinstancetype
  subnet_id     = aws_subnet.mysubnet01.id
}
