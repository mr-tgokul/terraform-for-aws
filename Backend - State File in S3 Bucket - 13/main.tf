provider "aws" {
  region  = "ap-south-1"
  profile = "terraform"
}

 terraform {
  backend "s3" {
    bucket = "Name of the S3 Bucket"
    region = "ap-south-1"
    key    = "testproject/terraform.tfstate"

  }
} 

resource "aws_vpc" "myvpc" {
  cidr_block = "10.3.0.0/16"
  tags = {
    Name = "MyVPC01"
  }
}

output "myoutput" {
  value = [aws_vpc.myvpc.owner_id]

}
