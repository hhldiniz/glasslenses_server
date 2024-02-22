resource "aws_vpc" "main-vpc" {
  cidr_block = ""

  tags = {
    Name: "Main VPC"
  }
}