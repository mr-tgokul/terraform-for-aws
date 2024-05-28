module "mymodule01uat" {
  source         = "./Development/Testing"
  mycidr         = "10.1.0.0/16"
  myvpc_tags     = "testing01"
  mysubnet01cidr = "10.1.1.0/24"
  mysubnet02cidr = "10.1.2.0/24"
  myami          = "ami-001843b876406202a"
  myinstancetype = "t2.micro"
}

module "mymodule02test" {
  source         = "./Development/Testing"
  mycidr         = "20.3.0.0/16"
  myvpc_tags     = "testing02"
  mysubnet01cidr = "20.3.1.0/24"
  mysubnet02cidr = "20.3.2.0/24"
  myami          = "ami-05a5bb48beb785bf1"
  myinstancetype = "t2.micro"
}
