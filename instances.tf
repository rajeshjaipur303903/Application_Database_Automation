# Security Groups
resource "aws_security_group" "web" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}

resource "aws_security_group" "db" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.web.id]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "db-sg"
  }
}

resource "aws_security_group" "bastion" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["152.58.121.20/32"]  # Replace with your IP for SSH access
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-sg"
  }
}

# Instances
resource "aws_instance" "web" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private.id
  security_groups        = [aws_security_group.web.id]
  key_name               = var.key_name

  user_data = file("${path.module}/user_data/web.sh")

  tags = {
    Name = "web-instance"
  }

  depends_on = [aws_route_table_association.private]
}

resource "aws_instance" "db" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private.id
  security_groups        = [aws_security_group.db.id]
  key_name               = var.key_name

  user_data = file("${path.module}/user_data/db.sh")

  tags = {
    Name = "db-instance"
  }

  depends_on = [aws_route_table_association.private]
}

resource "aws_instance" "bastion" {
  ami                       = var.ami
  instance_type             = "t2.micro"
  subnet_id                 = aws_subnet.public.id
  security_groups           = [aws_security_group.bastion.id]
  associate_public_ip_address = true
  key_name                  = var.key_name

  user_data = file("${path.module}/user_data/bastion.sh")

  tags = {
    Name = "bastion-instance"
  }

  depends_on = [aws_route_table_association.public]
}