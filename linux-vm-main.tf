# Define the security group for the Linux server
resource "aws_security_group" "aws-linux-sg" {
  name        = "linux-sg"
  description = "Allow incoming traffic to the Linux EC2 Instance"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    from_port   = 51820
    to_port     = 51822
    protocol    = "tcp"
    cidr_blocks = ["99.99.99.99/32"]
    description = "Allow Wireguard Tunnel"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["99.99.99.99/32"]
    description = "Allow incoming SSH connections"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}