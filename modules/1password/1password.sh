#!/usr/bin/env bash
set -euo pipefail

cat << EOF > /etc/yum.repos.d/1password.repo
[1password]
name=1Password Stable Channel
baseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=file:///etc/pki/rpm-gpg/1password.asc
EOF

wget https://downloads.1password.com/linux/keys/1password.asc -O /etc/pki/rpm-gpg/1password.asc

rpm-ostree install 1password 1password-cli
