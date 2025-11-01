resource "aws_instance" "web" {
  ami                    = "ami-0c02fb55956c7d316" # Ubuntu 22.04 (update region-wise)
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = var.key_name

  tags = {
    Name = "web-server"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ../ansible/inventory.ini"
  }
}

output "web_instance_ip" {
  value = aws_instance.web.public_ip
}
