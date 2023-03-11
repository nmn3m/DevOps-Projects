########
# vpc 
region = "us-east-1"
vpc_cidr = "10.0.0.0/16" 
enable_dns_support = "true" 
enable_dns_hostnames = "true"  


#####
# subnets
preferred_number_of_public_subnets = 2
preferred_number_of_private_subnets = 4


########
# natgateway and elastic ip
preferred_number_of_elastic_ip = 2
preferred_number_of_natgw = 2


###########
# external load balancer
name-ext-alb = "ext-load-balancer"

# internal load balancer
name-int-alb = "int-load-balancer"

# participate in the external and internal 
ip_address_type = "ipv4"
load_balancer_type = "application"