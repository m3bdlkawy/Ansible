#!/bin/bash
# Author: M.Abdelkawy
# Date: 10-05-2024
# Description: This script checks the OS version and installs Ansible accordingly for RHEL, CentOS, Fedora, and Ubuntu.
# Modified: 

# Function to check and install Python
install_python() {
    if ! command -v python3 &> /dev/null; then
        echo "Python3 is not installed. Installing Python3..."
        case "$ID" in
            rhel|centos)
                sudo dnf install -y python3
                ;;
            fedora)
                sudo dnf install -y python3
                ;;
            ubuntu)
                sudo apt update -y
                sudo apt install -y python3
                ;;
            *)
                echo "Unsupported OS for Python installation: ${NAME} ${VERSION_ID}"
                exit 1
                ;;
        esac
    else
        echo "Python3 is already installed."
    fi
}

# Function to install Ansible on RHEL and CentOS
install_ansible_rhel_centos() {
    # Update the system
    sudo dnf update -y

    # Enable EPEL repository
    sudo dnf install -y epel-release

    # Install Ansible
    sudo dnf install -y ansible

    # Verify the installation
    if ansible --version > /dev/null 2>&1; then
        echo "Ansible has been successfully installed on ${NAME} ${VERSION_ID}."
    else
        echo "Ansible installation failed on ${NAME} ${VERSION_ID}. You should debug why it is not installed."
    fi
}

# Function to install Ansible on Fedora
install_ansible_fedora() {
    # Update the system
    sudo dnf update -y

    # Install Ansible
    sudo dnf install -y ansible

    # Verify the installation
    if ansible --version > /dev/null 2>&1; then
        echo "Ansible has been successfully installed on ${NAME} ${VERSION_ID}."
    else
        echo "Ansible installation failed on ${NAME} ${VERSION_ID}. You should debug why it is not installed."
    fi
}

# Function to install Ansible on Ubuntu
install_ansible_ubuntu() {
    # Update the system
    sudo apt update -y
    sudo apt install -y software-properties-common

    # Add Ansible PPA and install Ansible
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt install -y ansible

    # Verify the installation
    if ansible --version > /dev/null 2>&1; then
        echo "Ansible has been successfully installed on ${NAME} ${VERSION_ID}."
    else
        echo "Ansible installation failed on ${NAME} ${VERSION_ID}. You should debug why it is not installed."
    fi
}

# Check the OS and call the appropriate function
if [ -f /etc/os-release ]; then
    . /etc/os-release
    case "$ID" in
        rhel|centos|fedora|ubuntu)
            install_python
            case "$ID" in
                rhel|centos)
                    install_ansible_rhel_centos
                    ;;
                fedora)
                    install_ansible_fedora
                    ;;
                ubuntu)
                    install_ansible_ubuntu
                    ;;
            esac
            ;;
        *)
            echo "Unsupported OS: ${NAME} ${VERSION_ID}"
            ;;
    esac
else
    echo "Cannot determine the OS. /etc/os-release file not found."
fi
