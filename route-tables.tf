
locals{
  rt_cidr_block = var.cidr_block_rt
  
}
resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = local.rt_cidr_block
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "MyRoute"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.rtb.id
  count = var.rt_count
}

//Adding NAT Gateway into the default main route table
resource "aws_default_route_table" "dfltrtb" {
  default_route_table_id = aws_vpc.main.default_route_table_id

  route {
    cidr_block = local.rt_cidr_block
    gateway_id = aws_nat_gateway.natgw.id
  }

  tags = {
    Name = "dfltrtb"
  }
}