resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.pub_cidr[count.index]
  availability_zone = var.pub_az[count.index]
  count = var.pub_count_value

  tags = {
    Name = "my-public-sub"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.pvt_cidr_block[count.index]
  availability_zone = var.pvt_az[count.index]
  count = var.pvt_count_value

  tags = {
    Name = "my-private-sub"
  }
}

data "aws_subnets" "sid" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.main.id]
  }

  tags = {
    Tier = "Public"
  }
}