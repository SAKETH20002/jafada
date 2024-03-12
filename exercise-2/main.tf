resource "aws_key_pair" "new_key" {
  key_name   = "terra_key"
  public_key = file("terra_key.pub")
}

resource "aws_instance" "web" {
  ami                    = "ami-08f7912c15ca96832" #change ami id for different region
  instance_type          = "t2.large"
  key_name               = aws_key_pair.new_key.key_name
  vpc_security_group_ids = [aws_security_group.Jenkins-sg.id]

  tags = {
    Name = "Jenkins-sonarqube"
  }
  root_block_device {
    volume_size = 30
  }

  provisioner "file" {
    source      = "install.sh"
    destination = "/home/ubuntu/install.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y ",
      "sudo chmod +x /home/ubuntu/install.sh",
      "sudo ./install.sh"

    ]
  }

  connection {
    user        = var.USER
    private_key = file("terra_key")
    host        = self.public_ip
  }


}
resource "aws_security_group" "Jenkins-sg" {
  name        = "Jenkins-sg"
  description = "Allow TLS inbound traffic"
  ingress = [
    for port in [22, 80, 443, 8080, 9000, 3000] : {
      description      = "inbound rules"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "jenkins-sg"
  }
}