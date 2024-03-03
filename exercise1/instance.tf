resource "aws_key_pair" "dove-key" {
  key_name   = "notkey"
  public_key = file("notkey.pub")
}

resource "aws_instance" "dove-inst" {
  ami                    = var.AMI[var.REGION]
  instance_type          = var.INSTANCE_TYPE[var.REGION]
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.dove-key.key_name
  vpc_security_group_ids = [var.SECURITY]
  tags = {
    Name    = "not-Instance"
    Project = "Dove"
  }

  provisioner "file" {
    source      = "apache.sh"
    destination = "/home/ubuntu/apache.sh"
  }

  provisioner "remote-exec" {

    inline = [
      "chmod +x /home/ubuntu/apache.sh",
      "sudo ./apache.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("notkey")
    host        = self.public_ip
  }
}
