resource "aws_instance" "myec2" {
   count = "1"
   ami = "ami-02354e95b39ca8dec"
   instance_type = "t2.nano"
   key_name = "terraform"
   tags          = {
     Name        = "Ansible_server"
}
   provisioner "remote-exec" {
     inline = [
       "sudo amazon-linux-extras install -y httpd",
       "sudo systemctl start httpd"
     ]

   connection {
     type = "ssh"
     user = "ec2-user"
     private_key = file("./terraform.pem")
     host = self.public_ip
   }
}
}
