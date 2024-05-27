variable "vpc_tags" {
  type = map(string)
  default = {
    Name    = "myvpc01"
    default = "yes"
    type    = "testing"

  }

}
