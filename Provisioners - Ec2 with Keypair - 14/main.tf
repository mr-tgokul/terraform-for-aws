provider "aws" {
  region  = "ap-south-1"
  profile = "terraform"
}

resource "aws_security_group" "mysg" {
  egress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
  ingress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = ""
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    }

  ]

}


resource "aws_key_pair" "myawskey" {
  key_name   = "awskeys"
  public_key = "ENTER YOUR KEY HERE"
}

resource "aws_instance" "myvm" {
  ami                         = "ami-001843b876406202a"
  instance_type               = "t2.micro"
  key_name                    = "awskeys"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.mysg.id]
  tags                        = { Name = "MyServer" }

}
