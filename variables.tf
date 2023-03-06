variable "do_token" {}

variable "region" {
  default = "ams3"
}

variable "droplet_size" {
  default = "s-2vcpu-2gb"
}

variable "vpc_range" {
  default = "10.0.0.0/24"  
}