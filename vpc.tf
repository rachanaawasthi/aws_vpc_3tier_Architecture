locals{
  vpc_cidr_block = var.vpc_cidr
}
resource "aws_vpc" "main" {
  cidr_block = local.vpc_cidr_block
  
  tags = {
    Name = "MyCustomVPC"
  }
}