provider "aws" {
  region  = "ap-south-1"
  profile = "terraform"
}

resource "aws_instance" "myvm" {
  ami                         = "ami-001843b876406202a"
  instance_type               = "t2.micro"
  key_name                    = "KEY Name"
  associate_public_ip_address = true
  tags                        = { Name = "MyVM" }

  provisioner "file" {
    source      = "C:/temp/myscript.sh"
    destination = "/home/ec2-user/myscript.sh"    

  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /home/ec2-user/myscript.sh",
      "sh /home/ec2-user/myscript.sh"
    ]

  }

  provisioner "local-exec" {
    #when    = destroy
    command = "echo 'VPC Deleted.......!' > a.txt"
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("C:/temp/Keypair/KEYNAMEm.pem")
    timeout     = "4m"
  }

}


output "custom_message_Check" {
  value = "This is a custom message from Terraform"
}

variable "name" {
  type    = string
  default = "BlackPanter"
}

output "custom_message" {
  value = "Hello, ${var.name}! Welcome to Terraform."
}
