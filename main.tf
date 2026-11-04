resource "aws_instance" "example" {
  instance_type = "t3.micro"
}
# creating aws_vpc 

resource "aws_vpc" "lab" {
  cidr_block = "10.0.0.0/16"
}