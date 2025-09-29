#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y tmux keepassxc htop btop

# install flatpaks
flatpak install -y com.vivaldi.Vivaldi

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

# install Ghostty
dnf5 -y copr enable scottames/ghostty
dnf5 -y install ghostty
dnf5 -y copr disable scottames/ghostty

# install Vivaldi
dnf5 -y install liberation-fonts-all
dnf5 -y install --repofrompath=vivaldi,https://repo.vivaldi.com/stable/rpm/x86_64/ \
  --repo=vivaldi vivaldi-stable

#### Example for enabling a System Unit File

systemctl enable podman.socket
