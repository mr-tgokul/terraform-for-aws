provider "aws" {
  region     = "ap-south-1"
  access_key = "XXXXXXXXXXXXXXXXXXXXXX"
  secret_key = "XXXXXXXXXXXXXXXXXXXX"

}

resource "aws_instance" "xyz" {
  ami           = "ami-09298640a92b2d12c"
  instance_type = "t2.micro"
}
