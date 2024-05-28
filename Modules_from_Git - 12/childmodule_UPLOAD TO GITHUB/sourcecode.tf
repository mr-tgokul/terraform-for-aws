provider "aws" {
  region  = "ap-south-1"
  profile = "terraform"
}
resource "aws_vpc" "myvpc" {
  cidr_block = var.myvpccidr
  tags = {
    Name = "TestingVPCfromTerraform"
  }
  lifecycle {
    prevent_destroy = false
  }

}

resource "aws_subnet" "mysubnet" {
  cidr_block = var.mysubnetcidr
  vpc_id     = aws_vpc.myvpc.id
  depends_on = [aws_vpc.myvpc]
}

resource "aws_instance" "myvm" {
  ami               = var.myamiid
  instance_type     = var.instance_type
  subnet_id         = aws_subnet.mysubnet.id
  availability_zone = "ap-south-1a"
  tags = {
    Name = "TerraformInstance"
  }

}

output "myoutput" {
  value = [aws_instance.myvm.id]
}
