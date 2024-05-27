provider "aws" {
  region     = "ap-south-1"
  access_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  secret_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

}

resource "aws_instance" "xyz" {
  ami           = var.myami
  instance_type = var.myinstancetype
  count         = var.mycount

  tags = {
    Name = "MyVM"
  }
}
