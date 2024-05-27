provider "aws" {
  region  = "ap-south-1"
  profile = "terraform"

}

resource "aws_instance" "xyz" {
  ami           = var.myami
  instance_type = var.myinstancetype
  count         = var.mycount

  tags = {
    Name = "MyVM"
  }
}
