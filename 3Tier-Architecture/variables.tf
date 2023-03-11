###########
# vpc

variable "region" {
      default = "us-east-1"
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "enable_dns_support" {
    default = "true"
}

variable "enable_dns_hostnames" {
    default ="true" 
}



######################
# subnet preferd number for public and private subnet
  variable "preferred_number_of_public_subnets" {
      default = null
}

  variable "preferred_number_of_private_subnets" {
      default = null
}


#######################
# nat gateway and elastic ip
variable "preferred_number_of_elastic_ip" {
  default = null
}

variable "preferred_number_of_natgw" {
  default = null
}



#####################
# EXTERNAL LOAD BALANCER VARIABLES
variable "name-ext-alb" {
  default = "ext-load-balancer"
}
variable "ip_address_type" {
  default = "ipv4"
}

variable "load_balancer_type" {
  default = "application"
}

###############
# Internal load balancer
variable "name-int-alb" {
  default = "int-load-balancer"
}
# variable "ip_address_type" {
#   default = "ipv4"
# }

# variable "load_balancer_type" {
#   default = "application"
# }