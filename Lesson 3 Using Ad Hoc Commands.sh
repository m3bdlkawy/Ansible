ansible-doc provide documentation about all aspects of ansible
ansible-doc -l to get list of available modules
ansible-doc -t  filter password hash
ansible-doc $(name of module) will give full information about module 


ansible all -m ping # which showing the available of the hosts
ansible all -m service -a "name=sshd state=started" # check if service is running 

ansible-playbook --syntax-check $playbook will perform a syntax check
