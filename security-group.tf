# Grupo de segurnça do LB
resource "aws_security_group" "lb-security" {
  name        = "${var.nome}-lb-web"
  description = "grupo de seguranca publoco"
  vpc_id      = aws_vpc.vpc-app.id

}

# regra do grupo de segurança libera porta 80 LB-http
resource "aws_security_group_rule" "lb-http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lb-security.id

}

# regra do grupo de segurança libera porta 80 LB-http
resource "aws_security_group_rule" "lb-out-ec2" {
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = aws_security_group.sg-privada-ec2.id
  security_group_id = aws_security_group.lb-security.id

}

# regra do grupo de segurança libera porta 443 LB-https
resource "aws_security_group_rule" "lb-https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lb-security.id

}


#------------------privado---------------------

# grupode segurança da ec2 subnet privada
resource "aws_security_group" "sg-privada-ec2" {
  name        = "${var.nome}-sg-privada-ec2"
  description = "grupo de seguranca privada "
  vpc_id      = aws_vpc.vpc-app.id
}


#regra do grupo de segurança libera entrada  porta 80
resource "aws_security_group_rule" "privado-http" {
  type      = "ingress"
  from_port = 80
  to_port   = 80
  protocol  = "tcp"

  security_group_id        = aws_security_group.sg-privada-ec2.id
  source_security_group_id = aws_security_group.lb-security.id
}


# regra do grupo de segurança libera saida porta 80 para atualizar o sistema operacional(somente para teste )
resource "aws_security_group_rule" "saida-http" {
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-privada-ec2.id

}


# regra do grupo de segurança libera saida porta 443 somente pra os endpoints VPC para conecxao ssm
resource "aws_security_group_rule" "saida-https" {
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-privada-ec2.id

}

# regra do grupo de segurança libera entrada porta 443
resource "aws_security_group_rule" "entrada-https" {
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.lb-security.id
  security_group_id        = aws_security_group.sg-privada-ec2.id

}

resource "aws_security_group_rule" "saida-rds" {
  type                     = "egress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.sg-rds.id
  security_group_id        = aws_security_group.sg-privada-ec2.id
}

#---------------RDS-----------------------

resource "aws_security_group" "sg-rds" {
  name        = "${var.nome}-sg-rds"
  description = "grupo de segurnca do rds"
  vpc_id      = aws_vpc.vpc-app.id
}



# regra do grupo de segurança libera entrada porta 443
resource "aws_security_group_rule" "entrada-rds" {
  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.sg-privada-ec2.id
  security_group_id        = aws_security_group.sg-rds.id

}
