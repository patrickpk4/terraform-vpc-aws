resource "aws_iam_role" "ssm-role" {
  name = "${var.nome}ssm-role"


  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}

#politica de atachamento
resource "aws_iam_policy_attachment" "ssm-policy" {
  name       = "${var.nome}-ssm-policy"
  roles      = [aws_iam_role.ssm-role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ssm-profile" {
  name = "${var.nome}-ssm-profile"
  role = aws_iam_role.ssm-role.name
}