Steps to follow
......................................

1. Launch an ec2 instance in AWS and install Jenkins on that. [Follow the Jenkins slide for jenkins installation] Also set the hostname as jenkins-host.


2. Install terraform inside your jenkins host and run the terraform code located inside terraform directory. [note that: change your access key and secret_key inside providers.tf and change your key_name inside main.tf ]


3. Now go to the Ansible_server node and Docker_host node do the following setup.


A. Create a user called ansadmin on both node.

useradd ansadmin

passwd ansadmin


B. Below command grant sudo access to ansadmin user. But we strongly recommended using "visudo" command if you are aware vi or nano editor. (on both host)

echo "ansadmin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers


C. Log in as a ansadmin user on master and generate ssh key (on Ansible_server node)

sudo su - ansadmin

ssh-keygen


D. Copy keys onto Docker_host (on Ansible_server)

ssh-copy-id ansadmin@<Docker_host-ip>


E. run on both host

usermod -aG docker ansadmin
