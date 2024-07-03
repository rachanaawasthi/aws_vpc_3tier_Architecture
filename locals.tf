locals{
  azs = var.pvt_az
  rt_cidr_block = var.cidr_block_rt
  ports = var.sg_ports
  db_sg_ports = var.db_security_ports
  vpc_cidr_block = var.vpc_cidr
}
