resource "aws_lb" "lb" {
  name               = "${var.nome}-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb-security.id]
  subnets            = [aws_subnet.subnet-publica.id, aws_subnet.subnet-publica2.id]

}

resource "aws_lb_target_group" "lb-tg" {
  name     = "${var.nome}-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc-app.id
  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    path                = "/ready" 
    port                = 80
    protocol            = "HTTP"
    matcher             = "200"
  }
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.lb-tg.arn
  target_id        = aws_instance.pivada-ec2.id
  port             = 80
}

resource "aws_lb_listener" "lb-listener" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb-tg.arn
  }
}