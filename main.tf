resource "aws_instance" "example" {
  instance_type = "t3.micro"
}
# creating aws_vpc 

resource "aws_vpc" "lab" {
  cidr_block = "10.0.0.0/16"
}
# creating aws_subnet

resource "aws_subnet" "lab" {
  vpc_id     = aws_vpc.lab.id
  cidr_block = "10.0.1.0/24"
}
