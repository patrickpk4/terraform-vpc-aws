
resource "aws_eip" "nat-eip" {
  tags = {
    Name = "${var.nome}-nat-eip"
  }
}

resource "aws_nat_gateway" "nat-privada" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id     = aws_subnet.subnet-publica.id

  depends_on = [aws_internet_gateway.gw]

  tags = {
    Name = "${var.nome}-nat-privada"
  }


}
