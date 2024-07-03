variable "pub_cidr" {
  type = list
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "pub_az" {
  type = list
  default = ["ap-south-1a","ap-south-1b"]
}

variable "pub_count_value" {
  type = string
  default = 2
  }

  variable "sg_ports" {
   type = list
   default = ["80","22"]
  }

  variable "db_security_ports" {
   type = list
   default = ["80","3306"]
  }

  variable "pvt_count_value" {
    default = "2"
  }

  variable "pvt_az" {
    type = list
    default = ["ap-south-1a","ap-south-1b"]
  }

  variable "pvt_cidr_block" {
    type = list
    default = ["10.0.5.0/24","10.0.8.0/24"]
  }

  variable "count_ec2" {
    default = 2
  }

  variable "vpc_cidr" {
    default = "10.0.0.0/16"
  }

  variable "cidr_block_rt"{
    default = "0.0.0.0/0"
    }

  variable "rt_count"{
    default = "2"
  }