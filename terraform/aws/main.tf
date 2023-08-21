provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

# K8s master instance
resource "aws_instance" "master" {
  ami           = var.ami
  instance_type = var.k8s_master_instance

  subnet_id                   = aws_subnet.public_1b.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.k8s_sg.id]
  key_name                    = aws_key_pair.k8s_key.key_name

  tags = {
    Name = "k8s-master"
  }
}

# K8s node instance
resource "aws_instance" "nodes" {
  ami           = var.ami
  instance_type = var.k8s_nodes_instance
  count         = var.k8s_nodes_count

  subnet_id                   = aws_subnet.public_1b.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.k8s_sg.id]
  key_name                    = aws_key_pair.k8s_key.key_name

  tags = {
    Name = "k8s-node-${count.index}"
  }
}