variable "myvpc_id" {
  default = "vpc-07020c27886a648c9"

}
variable "my_tags" {

  default = {
    "Name" = "DRG"
    "env"  = "Prod"
  }
}
