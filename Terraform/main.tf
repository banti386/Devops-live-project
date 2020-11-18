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
       "sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm",
       "sudo yum install ansible -y",
       "sudo yum install docker -y",
       "sudo service docker start"
        
     ]

   connection {
     type = "ssh"
     user = "ec2-user"
     private_key = file("./terraform.pem")
     host = self.public_ip
   }
}
}

# docker-host

resource "aws_instance" "myec3" {
   count = "1"
   ami = "ami-02354e95b39ca8dec"
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
     user = "ec2-user"
     private_key = file("./terraform.pem")
     host = self.public_ip
   }
}
   }
