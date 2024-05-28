provider "aws" {
  region  = "ap-south-1"
  profile = "terraform"
}

module "mymodule" {
  source       = "git::https://github.com/mr-tgokul/Terraform.git"
  myvpccidr    = "10.2.0.0/16"
  mysubnetcidr = "10.2.2.0/24"

}
