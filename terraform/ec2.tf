resource "aws_instance" "general_instances" {
  for_each = var.ec2-instances

  key_name      = each.value.key_name
  ami           = each.value.ami
  instance_type = each.value.instance_type
  tags          = each.value.tags

  vpc_security_group_ids = [aws_security_group.instance_sg[each.key].id]
}

output "public_vm0_ip_addr" {
  value = aws_instance.general_instances["apps-vm0"].public_ip
}

output "private_vm0_ip_addr" {
  value = aws_instance.general_instances["apps-vm0"].private_ip
}
