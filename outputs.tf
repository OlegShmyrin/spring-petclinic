### The Ansible inventory file
resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.tmpl",{
     AppServer-dns=aws_instance.AppServer.private_dns,
     AppServer-pr-ip=aws_instance.AppServer.private_ip,
     AppServer-id=aws_instance.AppServer.id,

     MySqlServer-dns=aws_instance.MySqlServer.private_dns,
     MySqlServer-pr-ip=aws_instance.MySqlServer.private_ip,
     MySqlServer-id=aws_instance.MySqlServer.id,
 }
 )
 filename = "inventory"
}