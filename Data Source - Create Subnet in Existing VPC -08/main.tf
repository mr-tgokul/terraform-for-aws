provider "aws" {
  region  = "ap-south-1"
  profile = "terraform"
}

data "aws_vpc" "myvpc" {
  id = var.myvpc_id # Provide VPC ID in Variables # HarD Coded

}

resource "aws_subnet" "mysubnet01" {
  vpc_id     = data.aws_vpc.myvpc.id
  cidr_block = "10.0.0.0/25" # Mention the CIDR BLock which you want to Create under VPC
  tags       = var.my_tags
}

output "myoutput" {

  value = data.aws_vpc.myvpc.* # * means Prints Every Information

}
