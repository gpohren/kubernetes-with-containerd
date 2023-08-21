# Quick configuration
variable "project_k8s" {
  description = "Cluster K8s"
  default     = "k8s-with-containerd"
}

variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile"
  default     = "main"
}

variable "ami" {
  description = "Ubuntu, 20.04 LTS"
  default     = "ami-0261755bbcb8c4a84"
}

variable "aws_key_path" {
  description = "Key path"
  default     = "../../keys/aws_key.pub"
}

variable "tags" {
  default = {
    Project    = "k8s-with-containerd"
    enviroment = "dev"
  }
}

# K8s master instance
variable "k8s_master_instance" {
  description = "Kubernetes master instance"
  default     = "t2.medium"
}

variable "k8s_master_count" {
  description = "Kubernetes master count"
  default     = 1
}

# K8s node instance
variable "k8s_nodes_instance" {
  description = "Kubernetes nodes instance"
  default     = "t2.micro"
}

variable "k8s_nodes_count" {
  description = "Kubernetes nodes count"
  default     = 2
}