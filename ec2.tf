resource "aws_instance" "web" {
  ami           = "ami-08df646e18b182346"
  instance_type = "t2.micro"
  #key_name = "rachana"
  subnet_id = aws_subnet.public[count.index].id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  count = 2

  tags = {
    Name = "WebServer"
  }
}

resource "aws_instance" "db" {
  count = length(local.azs)
  ami           = "ami-08df646e18b182346"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private[count.index].id
  vpc_security_group_ids = [aws_security_group.allow_tls_db.id]
  tags = {
    Name = "DB Server-${count.index + 1}"
  }
}
