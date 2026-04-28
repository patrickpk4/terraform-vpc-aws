resource "aws_vpc" "vpc-app" {
  cidr_block           = var.cidr-vpc
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.nome}-vp-app"
  }
}

resource "aws_vpc_endpoint" "ssm" {
  vpc_id              = aws_vpc.vpc-app.id
  service_name        = "com.amazonaws.us-east-1.ssm"
  subnet_ids          = [aws_subnet.subnet-publica.id]
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.lb-security.id]
  private_dns_enabled = true

}

resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_id              = aws_vpc.vpc-app.id
  service_name        = "com.amazonaws.us-east-1.ssmmessages"
  subnet_ids          = [aws_subnet.subnet-publica.id]
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.lb-security.id]
  private_dns_enabled = true

}

resource "aws_vpc_endpoint" "ec2messages" {
  vpc_id              = aws_vpc.vpc-app.id
  service_name        = "com.amazonaws.us-east-1.ec2messages"
  subnet_ids          = [aws_subnet.subnet-publica.id]
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.lb-security.id]
  private_dns_enabled = true

}