provider "aws" {
  region  = "ap-south-1"
  profile = "terraform"

}
locals {
  my_cidr = "10.5.0.0/16"
  my_tags = {
    env  = "testing"
    Name = "vpc-test"
  }
}

resource "aws_vpc" "myvpc" {
  cidr_block       = local.my_cidr
  instance_tenancy = "default"
  tags             = local.my_tags

}

resource "aws_subnet" "mysubnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.5.1.0/24"

  tags = local.my_tags
}

output "myoutput" {
  #value = aws_vpc.myvpc.id
  value = [aws_vpc.myvpc.id, aws_subnet.mysubnet.id]

} 
