#!/bin/bash
# Installs some common utilities I use on a Debian system
# This is for personal use, be aware and read carefully!

set -e
set -o pipefail

check_if_sudo() {
    if [ "$EUID" -ne 0 ]; then
        echo "Root is required"
        exit 1
    fi
}

setup_repos() {
    cat <<-EOF > /etc/apt/sources.list
        deb http://deb.debian.org/debian buster main contrib non-free
        deb-src http://deb.debian.org/debian buster main contrib non-free

        deb http://deb.debian.org/debian-security/ buster/updates main contrib non-free
        deb-src http://deb.debian.org/debian-security/ buster/updates main contrib non-free

        deb http://deb.debian.org/debian buster-updates main contrib non-free
        deb-src http://deb.debian.org/debian buster-updates main contrib non-free
EOF
}

upgrade_system() {
    apt update || true
    apt upgrade -y
}

basic_utilities() {
    apt update || true
    apt install -y \
        build-essential \
        git \
        neofetch \
        texlive \
        tree \
        tmux \
        vim
}

install_nvidia() {
    if [ -d /sys/module/battery ]; then
        # Assuming a laptop
        # "acpi_osi=! acpi_osi='Windows 2009'" may be required as kernel parms
        apt install -y \
            nvidia-kernel-dkms \
            bumblebee-nvidia \
            primus \
            tlp
    else
        # Desktop
        apt install -y \
            linux-headers-"$(uname -r)" \
            nvidia-driver
    fi
}

install_docker() {
    apt update || true
    apt install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common

    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
    apt-key fingerprint 0EBFCD88
    add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

    apt install -y \
        docker-ce \
        docker-ce-cli \
        containerd.io

    usermod -aG docker "$TARGET_USER"
}

c_dev() {
    apt update || true
    apt install -y \
        cmake \
        valgrind \
        clang \
        clang-format
}

java_dev() {
    apt update || true
    apt install -y \
        openjdk-11-jdk \
        openjdk-11-source \
        ant \
        maven
}

python_dev() {
    apt update || true
    apt install -y \
        python3-dev \
        python3-pip
}

ruby_dev() {
    apt update || true
    apt install -y \
        ruby-full
}

install_snap() {
    apt update || true
    apt install -y \
        snapd

    snap install spotify
    snap install code --classic
    snap install eclipse --classic
}

config() {
    cp -r config/.[!.]* "/home/$TARGET_USER"

    local vscodedir="/home/$TARGET_USER/.config/Code/User"
    if [ -e "$vscodedir" ]; then
        cp config/settings.json "$vscodedir"
    fi
}

usage() {
    echo "Usage install.sh <command> <user>"
    echo "command"
    echo "  base        - setup sources and basic utils"
    echo "  nvidia      - setup nvidia graphic driver"
    echo "  dev         - setup c, java, py and ruby dev env"
    echo "  docker      - setup docker"
    echo "  snap        - setup snap"
    echo "  config      - copy config files to user folder"
    echo "  usage       - this menu"
    echo "  all         - all of the above"
}

main() {
    readonly TARGET_USER="${2:-${SUDO_USER:-USER}}"

    if [[ ! "$(grep NAME /etc/*{release,version})" == *"Debian"* ]]; then
        echo "Not running a Debian system"
        exit 1
    fi

    local cmd=$1
    if [[ -z "$cmd" ]]; then
        usage
        exit 1
    fi

    read -r -p "Install $cmd for user $TARGET_USER? [y/n] " input
    if  [[ ! $input =~ ^[Yy]$ ]]; then
        exit 1
    fi

    case $cmd in
    "base")
        check_if_sudo
        setup_repos
        upgrade_system
        basic_utilities
        ;;
    "nvidia")
        check_if_sudo
        install_nvidia
        ;;
    "dev")
        check_if_sudo
        upgrade_system
        c_dev
        java_dev
        python_dev
        ruby_dev
        ;;
    "docker")
        check_if_sudo
        install_docker
        ;;
    "snap")
        check_if_sudo
        install_snap
        ;;
    "config")
        config
        ;;
    "usage")
        usage
        ;;
    "all")
        check_if_sudo
        setup_repos
        upgrade_system
        basic_utilities
        install_nvidia
        c_dev
        java_dev
        python_dev
        ruby_dev
        install_docker
        install_snap
        config
        ;;
    esac
}

main "$@"
