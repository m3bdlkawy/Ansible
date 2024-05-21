ansible -i inventory all -u mohamed -k -b -K -m user -a  "name=ansible"
ansible -i inventory all -u mohamed -k -b -K -m shell -a "echo 1111 | passwd --stdin ansible"
#this command allow you to set a password for auser without opening an interactive prompt

echo password | passwd --stdin ansible 

#Add SSH key to all servers
for i in ansible1 ansible2 ; do ssh-copy-id $i ; done 

 #add ansible user to sudoers files to get sudo permission
ansible -i inventory all -u mohamed -b -K -m shell -a 'echo "ansible ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/ansible'
#execute acommand in remote server 
ansible -i inventory all -u ansible -b -m command -a "ls -al /root " 
