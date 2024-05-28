provider "aws" {
  region  = "ap-south-1"
  profile = "terraform"
}

data "aws_ami" "myami" {
  owners      = ["amazon"] # Filter Based on the Owner ofthe AMI
  most_recent = true
  filter {
    name   = "name"                    # Filter using Name
    values = ["Windows_Server-2022-*"] # AMI Starts with Windows_Server-2022
  }

}


resource "aws_instance" "vname" {
  ami           = data.aws_ami.myami.id # ID Retrived from above Filter
  instance_type = "t2.micro"
  tags = {
    Name = "testing"
  }

}
output "myamiid" {
  value = data.aws_ami.myami.id # Display the AMI ID which was filtered above
}
output "myamiid2" {
  value = resource.aws_instance.vname.* #Display the Instance Details
}
