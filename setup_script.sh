# This script consolidates the installation and initial setup of a development
# environment on a linux ubuntu 18.04 machine
# Commands as they were run individually on the comand line are commented 
# below these commented commands are the commands translated from command 
# line input into a shell script format


# install python pip
yes | sudo apt install python3-pip

# install snap
#sudo apt install snapd
yes | sudo apt install snapd

# install spotify
snap install spotify

# install pycharm
#snap install pycharm-community --classic
yes | snap install pycharm-community --classic

# install vs code
yes | sudo apt update
yes | sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
yes | sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
yes | sudo apt update
yes |sudo apt install code


# collect repo for google chrome latest stable
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# install google chrome
#yes | sudo apt install ./google-chrome-stable_current_amd64.deb
yes | sudo apt install ./google-chrome-stable_current_amd64.deb

#yes | sudo apt-get install vim
yes | sudo apt-get install vim

###############################################
# Dev Ops an other tools

# install ansible
sudo apt update
yes | sudo apt install software-properties-common
yes | sudo apt-add-repository --yes --update ppa:ansible/ansible
yes | sudo apt install ansible


# install aws-iam-authenticator
curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.17.9/2020-08-04/bin/linux/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
mkdir -p $HOME/bin && cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc


# python stuff for DevOps
pip3 install ansible awscli pipenv

# install aws-vault
sudo curl -L -o /usr/local/bin/aws-vault https://github.com/99designs/aws-vault/releases/download/v4.2.0/aws-vault-linux-amd64
sudo chmod 755 /usr/local/bin/aws-vault
sudo echo 'export AWS_VAULT_BACKEND="file"' >> ~/.bashrc

# install packer
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install packer

# collect certificates to install docker
#yes | apt install apt-transport-https ca-certificates curl software-properties-common
yes | apt install apt-transport-https ca-certificates curl software-properties-common

# collect key for docker 
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# add docker official repo to repo list
#sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
yes | add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

# install docker
#yes | apt install docker-ce
yes | apt install docker-ce
yes | sudo apt install docker-compose


# add user to docker group
#sudo usermod -aG docker ${USER}
sudo usermod -aG docker ${USER}

# Install terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
yes | sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
yes | sudo apt-get update && sudo apt-get install terraform

# install kubectl
yes | snap install kubectl --classic

# install helm
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
yes | sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
yes | sudo apt-get update
yes | sudo apt-get install helm


# install slack
#sudo snap install slack --classic
yes | sudo snap install slack --classic

# install virtual box
# collect keys for source
#wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -

#wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

#sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
yes | sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"

#sudo apt update
yes | sudo apt update

#yes | sudo apt install virtualbox-6.0
yes | sudo apt install virtualbox-6.0

# install virtualbox extension pack
wget https://download.virtualbox.org/virtualbox/6.0.0/Oracle_VM_VirtualBox_Extension_Pack-6.0.0.vbox-extpack

#yes |sudo VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-6.0.0.vbox-extpack
yes | sudo VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-6.0.0.vbox-extpack

# install htop
#sudo apt-get install htop
yes | sudo apt-get install htop

# install tree
yes | sudo snap install tree

# set vim as default editor 
export GIT_EDITOR=vim

git config --global core.editor "vim"

#####################################
## install multiple versions of python
#sudo apt update && sudo apt upgrade -y
#
## get other libraries to install python from source
#sudo apt-get install build-essential checkinstall
#sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev \
#    libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev
#
## collect desired version of python
#cd /opt/
#sudo wget  https://www.python.org/ftp/python/3.7.7/Python-3.7.7.tgz

# untar
#sudo tar xzf Python-3.8.0.tgz
# cd into directory ond install from source
#cd Python-3.7.7
#sudo ./configure --enable-optimizations
#sudo make altinstall
# tell ubuntu about alternative pythons, these will vary accordingly to
# where you have python installed (for this machine 3.7.7 was installed 
# in /usr/local/bin/
#update-alternatives --install /usr/bin/python python /usr/bin/python3.6 1
#update-alternatives --install /usr/bin/python python /usr/bin/python3.8 2 
# check to see alternatives
#update-alternatives --list python
#/usr/bin/python3.6
#/usr/local/bin/python3.8
# change alternatives
#update-alternatives --config python
###################################
