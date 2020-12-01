resource "aws_instance" "myec2" {
   ami = "ami-0affd4508a5d2481b"
   instance_type = "t2.nano"
   key_name = "terraform"
   tags          = {
     Name        = "Ansible_server"
}
   provisioner "remote-exec" {
     inline = [
       "sudo yum -y install epel*",
       "sudo yum install ansible -y",
       "sudo yum install docker -y",
       "sudo service docker start"

     ]

   connection {
     type = "ssh"
     user = "centos"
     private_key = file("./terraform.pem")
     host = self.public_ip
   }
}
}

# docker-host

resource "aws_instance" "myec3" {
   ami = "ami-0affd4508a5d2481b"
   instance_type = "t2.nano"
   key_name = "terraform"
   tags          = {
     Name        = "Docker-host"
}

   provisioner "remote-exec" {
     inline = [
       "sudo yum install docker -y",
       "sudo service docker start"

     ]

   connection {
     type = "ssh"
     user = "centos"
     private_key = file("./terraform.pem")
     host = self.public_ip
   }
}
   }

