resource "aws_eip" "nat-eip" {
  count = var.preferred_number_of_elastic_ip
  depends_on = [
    aws_internet_gateway.mn3m-ig
  ]
  vpc = true
  tags = {
    "name" = format("nat-eip-%d",count.index)
  }
}
resource "aws_nat_gateway" "natgw" {
  count = var.preferred_number_of_natgw
  allocation_id = aws_eip.nat-eip[count.index].id
  subnet_id     = element(aws_subnet.public.*.id, count.index)

  tags = {
    "Name" = format("natgw-%d",count.index)
  }
  depends_on = [aws_internet_gateway.mn3m-ig]
}