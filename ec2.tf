locals{
  azs = var.pvt_az
}
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

    provisioner "file" {
    source = "./rachana.pem"
    destination = "/home/ec2-user/rachana.pem"
  
    connection {
      type = "ssh"
      host = self.public_ip
      user = "ec2-user"
      private_key = "${file("./rachana.pem")}"
    }  
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