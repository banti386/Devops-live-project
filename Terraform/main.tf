# docker-host

resource "aws_instance" "myec2" {
   ami = "ami-0affd4508a5d2481b"
   instance_type = "t2.nano"
   key_name = "terraform"
   tags          = {
     Name        = "Docker-host"
}

   provisioner "local-exec" {
      command = <<EOT
         echo [all] >> inventory;
         echo ${aws_instance.myec2.public_ip} >> inventory;
         sleep 120;
         export ANSIBLE_HOST_KEY_CHECKING=False;
         ansible-playbook  -v -u centos --private-key=./terraform.pem playbook.yml -i inventory;
EOT
      }
   }



