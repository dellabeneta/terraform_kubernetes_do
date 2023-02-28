#!/bin/bash

sleep 120

# INSTALACAO MODULOS DO KERNEL
cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf overlay br_netfilter
EOF
sudo modprobe overlay
sudo modprobe br_netfilter

# CONFIGURACAO DOS PARAMATROS DO SYSCTL SE MANTEM APOS REBOOT
cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf 
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF             
sysctl --system

# INSTALACAO PRE REQUISITOS DO CONTAINERD
sudo apt update && sudo apt install ca-certificates gnupg lsb-release -y

# ADICIONANDO CHAVE GPG DO DOCKER
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# CONFIGURANDO DO REPOSITORIO
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# INSTALANDO DO CONTAINERD
sudo apt update && sudo apt install containerd.io -y

# AJUSTANDO CONFIGURACAO PADRAO DO CONTAINERD
sudo mkdir -p /etc/containerd && containerd config default | sudo tee /etc/containerd/config.toml

# CONFIGURANDO O PARAMETRO SYSTEMCGROUP PARA TRUE  
sed -i 's/SystemdCgroup = false/SystemdCgroup = true/g' /etc/containerd/config.toml

# REINICIANDO O CONTAINERD
sudo systemctl restart containerd

# INSTALACAO DO KUBEADM, KUBELET E KUBECTL
#wget https://packages.cloud.google.com/apt/doc/apt-key.gpg
#mv apt-key.gpg /usr/share/keyrings/kubernetes-archive-keyring.gpg
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
#sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://dellabeneta.nyc3.digitaloceanspaces.com/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update && sudo apt install kubelet kubeadm kubectl -y
sudo apt-mark hold kubelet kubeadm kubectl