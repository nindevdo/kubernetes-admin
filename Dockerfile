FROM manjarolinux/base as helmsman

RUN pacman -S --noconfirm --needed git base-devel yay

 RUN useradd --system --create-home helmsman \
  && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && echo "helmsman ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/helmsman \
  && echo 'root:root' | chpasswd \
  && echo "helmsman:helmsman" | chpasswd

USER helmsman

# Install packages
RUN yay -Syuv --noconfirm \
aws \
google-cloud-sdk \
kubectl \
kubeadm
