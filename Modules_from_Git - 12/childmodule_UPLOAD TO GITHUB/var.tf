variable "myvpccidr" {
  default = "10.1.0.0/16"

}
variable "mysubnetcidr" {
  default = "10.1.1.0/24"
}

variable "myamiid" {
  default = "ami-001843b876406202a"
}

variable "instance_type" {
  default = "t2.micro"
}
