resource "aws_subnet" "subnet-publica" {
  vpc_id            = aws_vpc.vpc-app.id
  cidr_block        = var.cidr-publica
  availability_zone = "${var.regiao}a"

  tags = {
    Name = "${var.nome}-subnet-publica"
  }
}

resource "aws_subnet" "subnet-publica2" {
  vpc_id            = aws_vpc.vpc-app.id
  cidr_block        = var.cidr-publica2
  availability_zone = "${var.regiao}b"

  tags = {
    Name = "${var.nome}-subnet-publica2"
  }
}

resource "aws_subnet" "subnet-privada" {
  vpc_id            = aws_vpc.vpc-app.id
  cidr_block        = var.cidr-privada
  availability_zone = "${var.regiao}a"

  tags = {
    Name = "${var.nome}-subenet privada"
  }
}

resource "aws_subnet" "db-privado" {
  vpc_id            = aws_vpc.vpc-app.id
  cidr_block        = var.cidr-db
  availability_zone = "${var.regiao}a"

}
resource "aws_subnet" "db-privado2" {
  vpc_id            = aws_vpc.vpc-app.id
  cidr_block        = var.cidr-db2
  availability_zone = "${var.regiao}b"

}