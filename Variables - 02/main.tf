provider "aws" {
  region     = "ap-south-1"
  access_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXX"
  secret_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

}

resource "aws_instance" "xyz" {
  ami           = var.myami
  instance_type = var.myinstancetype
  count         = var.mycount

  tags = {
    Name = "MyVM"
  }
}
