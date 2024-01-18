resource "aws_security_group" "aws_sg_allows_http_web" {
  
  name = "aws_sg_allows_http_web"
  
  description = "Security Group EC2 Instance"

  ingress {

    description = "Inbound Rule"
    from_port = 22
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    description = "Outbound Rule"
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    }

}

locals {
  lab3_ami = "ami-0a0d9cf81c479446a"
}

resource "aws_instance" "dsa_instance" {

  count = local.lab3_ami == "ami-0a0d9cf81c479446a" ? 3 : 0
  
  ami = local.lab3_ami  
  
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.aws_sg_allows_http_web.id]
  
  key_name = "plz-lab3"

  tags = {
    Name = "Server-${count.index + 1}"
  }

  provisioner "file" {

    # Este source é o arquivo na máquina local(neste caso, no ambiente Linux no container) 
    source      = "dsa_script.sh"

    # Este arquivo será colocado no diretório /tmp la no servidor da EC2 
    # tmp é uma pasta padrão do Linux que significa temporário
    destination = "/tmp/dsa_script.sh"

    # Para copiar o arquivo local e colocar no servidor, precisa conectar com o servidor precisar de uma connection
    connection {
      type     = "ssh"
      user     = "ec2-user"
      private_key = file("plz-lab3.pem")
      host     = self.public_ip
    }
  }

  # depois de copiar o arquivo, chamo o remote-exec para mudar o privilegio do arquivo, colocar o arquivo como executável no Linux e então executar o script

  provisioner "remote-exec" {
    
    inline = [
      "chmod +x /tmp/dsa_script.sh", 
      "/tmp/dsa_script.sh"
      ]

    connection {
      type     = "ssh"
      user     = "ec2-user"
      private_key = file("plz-lab3.pem")
      host     = self.public_ip
    }
  }
}
