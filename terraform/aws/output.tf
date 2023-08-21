output "instance_k8s_master" {
  description = "Public IP address K8s master"
  value       = aws_instance.master.public_ip
}

output "instance_k8s_nodes" {
  description = "Public IP address K8s nodes"
  value       = aws_instance.nodes.*.public_ip
}