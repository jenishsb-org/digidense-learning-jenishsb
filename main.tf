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
# creating aws_security_group

resource "aws_security_group" "lab" {
  name   = "lab-sg"
  vpc_id = aws_vpc.lab.id
}
# creating aws_internet_gateway

resource "aws_internet_gateway" "lab" {
  vpc_id = aws_vpc.lab.id
}
# creating aws_route_table

resource "aws_route_table" "lab" {
  vpc_id = aws_vpc.lab.id
}
# creating aws ec2

resource "aws_instance" "lab" {
  ami           = "ami-dummy"
  instance_type = "t2.micro"
}
# creating aws_route_table

resource "aws_route_table" "lab" {
  vpc_id = aws_vpc.lab.id

  tags = {
    Name = "corrected-route"
  }
}