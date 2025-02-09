### The Ansible inventory file
resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.tmpl",{
     AppServer-dns=aws_instance.AppServer.private_dns,
     #AppServer-ip=aws_instance.AppServer.public_ip,
     AppServer-pr-ip=aws_instance.AppServer.private_ip,
     AppServer-id=aws_instance.AppServer.id}
     #AppServer-key=aws_key_pair.generated_key.generated_key_name}
 )
 filename = "inventory"
}