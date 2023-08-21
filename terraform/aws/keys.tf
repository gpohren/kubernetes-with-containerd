resource "aws_key_pair" "k8s_key" {
  key_name   = "k8s_key"
  public_key = file(var.aws_key_path)
  tags       = var.tags
}