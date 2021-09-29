### The Ansible inventory file
resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.tmpl",
 {
  AppServer-dns = aws_instance.AppServer.*.private_dns,
  AppServer-ip = aws_instance.AppServer.*.public_ip,
  #private-ip = aws_instance.AppServer.*.private_ip,
  AppServer-id = aws_instance.AppServer.*.id
 }
 )
 filename = "inventory"
}