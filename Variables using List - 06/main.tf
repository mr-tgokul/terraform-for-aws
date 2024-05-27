provider "aws" {
  region  = "ap-south-1"
  profile = "terraform"

}

resource "aws_iam_user" "myusers" {
  count = length(var.iamusers)
  name  = var.iamusers[count.index]
}
