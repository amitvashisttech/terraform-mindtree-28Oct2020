output "PublicIP_East_Frontend" {
  value = aws_instance.instance.*.public_ip
}
