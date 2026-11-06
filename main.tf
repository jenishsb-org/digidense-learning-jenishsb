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
#creating aws ec2

resource "aws_instance" "lab" {
  ami           = "ami-dummy"
  instance_type = "t2.micro"
}
# Test protected main
# creating s3 bucket

resource "aws_s3_bucket" "lab" {
  bucket = "git-lab-demo-bucket"
}
# creating bucket versioning

resource "aws_s3_bucket_versioning" "lab" {
  bucket = aws_s3_bucket.lab.id
}
# creating public access

resource "aws_s3_bucket_public_access_block" "lab" {
  bucket = aws_s3_bucket.lab.id
}
resource "aws_s3_bucket_lifecycle_configuration" "lab" {
  bucket = aws_s3_bucket.lab.id
}
# creating kms_key

resource "aws_kms_key" "example" {
  description             = "KMS key for encryption"
  deletion_window_in_days = 7
  enable_key_rotation     = true
}