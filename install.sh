#!/bin/bash
# Installs some common utilities I use on a Debian system
# This is for personal use, be aware!

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

upgrade() {
    apt update || true
    apt upgrade -y
}

basic_utilities() {
    apt update || true
    apt install -y \
        build-essential \
        git \
        neofetch \ # Truly, a basic utility.
        texlive \
        tree \
        tmux \
        vim
}

nvidia() {
    case $1 in
        "desktop")
            apt install -y \
                linux-headers-"$(uname -r)"
                nvidia-driver
            ;;
        "laptop")
            apt install -y \
                nvidia-kernel-dkms
                bumblebee-nvidia
                primus
                tlp
            # "acpi_osi=! acpi_osi='Windows 2009" may be required as kernel parms'
            ;;
        *)
            echo "Usage: install.sh nvidia <desktop,laptop>"
            exit 1
            ;;
    esac
}

docker() {
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
    
    usermod -aG docker "$USER"
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

snap() {
    apt update || true
    apt install -y \
        snapd

    snap install spotify
    snap install code --classic
    snap install eclipse --classic
}

config() {
    for dotfile in config/.*; do
        cp -r "$dotfile" "$HOME"
    done

    local vscodedir="$HOME/.config/Code/User"
    if [ -e "$vscodedir" ]; then
        cp config/settings.json "$vscodedir"
    fi
}

usage() {
    echo "install.sh: basic setup automatic installer"
    echo "Usage:"
    echo "  base        - setup sources and basic utils"
    echo "  nvidia      - setup nvidia graphic driver"
    echo "  dev         - setup c, java, py and ruby dev env"
    echo "  docker      - setup docker"
    echo "  snap        - setup snap plus some snaps"
    echo "  config      - copy config files to user folder"
}

main() {
    local cmd=$1
    local version
    version="$(grep NAME /etc/*{release,version})"
    if [[ ! $version == *"Debian"* ]]; then
        echo "Not running a Debian system"
        exit 1
    fi

    case $cmd in
    "base")
        check_if_sudo
        setup_repos
        upgrade
        basic_utilities
        ;;
    "nvidia")
        check_if_sudo
        nvidia "$2"
        ;;
    "dev")
        check_if_sudo
        upgrade
        c_dev
        java_dev
        python_dev
        ruby_dev
        ;;
    "docker")
        check_if_sudo
        docker
        ;;
    "snap")
        check_if_sudo
        snap
        ;;
    "config")
        config
        ;;
    *)
        usage
        exit 1
        ;;
    esac
}

main "$@"
