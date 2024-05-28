provider "aws" {
  region  = "ap-south-1"
  profile = "terraform"
  alias   = "mumbai" # Setting Alias for ap-south-1 region as mumbai
}

provider "aws" {
  region  = "us-east-1"
  profile = "terraform"
  alias   = "useast" # Setting Alias for us-east-1 region as useast
}

resource "aws_vpc" "mymumbaivpc" {
  cidr_block = "10.3.0.0/16"
  provider   = aws.mumbai # Use the Alias name of the region so the resource gets created 
  tags = {
    Name = "mumbaivpc"
  }
}

resource "aws_vpc" "myuseastvpc" {
  cidr_block = "10.6.0.0/16"
  provider   = aws.useast #  Use the Alias name of the region so the resource gets created 
  tags = {
    Name = "usvpc"
  }
  lifecycle {
    prevent_destroy = true
  }
}

output "mymumbaivpcoutput" { # Output of Mumbai VPC
  value = [aws_vpc.mymumbaivpc.id, aws_vpc.mymumbaivpc.tags, aws_vpc.mymumbaivpc.instance_tenancy]
}

output "myuseastvpcoutput" { # Output of Useast VPC
  value = [aws_vpc.myuseastvpc.id, aws_vpc.myuseastvpc.tags, aws_vpc.myuseastvpc.instance_tenancy]
}
