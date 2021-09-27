FROM manjarolinux/base as helmsman

RUN pacman -S --noconfirm --needed git base-devel yay

# Create a user for yay to use as non root to install AUR packages
RUN useradd --system --create-home helmsman \
  && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && echo "helmsman ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/helmsman \
  && echo 'root:root' | chpasswd \
  && echo "helmsman:helmsman" | chpasswd

USER helmsman

# Install packages
RUN yay -Syuv --noconfirm \
aws-cli \
google-cloud-sdk \
eksctl \
etcd \
kops \
kubeadm \
kube-aws \
kubectl \
strace