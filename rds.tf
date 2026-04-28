
resource "aws_db_subnet_group" "grupo-rds" {
  name       = "${var.nome}-grupo-rds"
  subnet_ids = [aws_subnet.db-privado.id, aws_subnet.db-privado2.id]
}

resource "aws_db_instance" "rds" {
  allocated_storage      = 10
  db_name                = var.db-name
  engine                 = "postgres"
  engine_version         = "13"
  instance_class         = "db.t3.micro"
  username               = var.db-username
  password               = var.db-password
  availability_zone      = "${var.regiao}a"
  publicly_accessible    = false
  skip_final_snapshot    = true
  multi_az               = false
  db_subnet_group_name   = aws_db_subnet_group.grupo-rds.name
  vpc_security_group_ids = [aws_security_group.sg-rds.id]
}