#!/bin/bash

COL_BLUE="\x1b[34;01m"
COL_RESET="\x1b[39;49;00m"
 
deb_packages(){
DEB_FILES="/home/vagrant/roles/deb_packages/tasks/main.yml"
run_deb_packages_ansible="ansible-playbook $DEB_FILES"
#check for main.yml file
if [ -f $DEB_FILES ]; 
then
    echo "main.yml file found for deb_packages playbook"
    command $run_deb_packages_ansible
else 
   echo "main.yml not found for deb_packages playbook. exiting"
fi
}

mysql() {
MYSQL_FILE="/home/vagrant/roles/mysql/tasks/main.yml"
run_mysql_ansible="ansible-playbook $MYSQL_FILE"
#check for main.yml file
if [ -f $MYSQL_FILE ]; 
then
    echo "main.yml file found running mysql playbook"
    command $run_mysql_ansible
else 
   echo "main.yml not found, mysql playbook not executed" >&2
fi
}

apache2(){
APACHE_FILE="/home/vagrant/roles/apache2/tasks/main.yml"
run_apache_ansible="ansible-playbook $MYSQL_FILE"
#check for main.yml file
if [ -f $APACHE_FILE ];
then
    echo "main.yml file found running the apache2 playbook"
    command $run_apache_ansible
else
   echo -e $COL_BLUE "main.yml not found, apache2 playbook not executed" $COL_RESET
   fi
}

eval deb_packages
eval apache2
eval mysql

