apt remove --purge -y evince
apt remove --purge -y seahorse
apt remove --purge -y gedit
apt remove --purge -y nautilus
apt remove --purge -y file-roller
apt remove --purge -y firefox


apt install -y i3 i3-wm i3status dmenu 
apt install -y mesa-utils mesa-utils-extra
apt install -y ubuntu-drivers-common 

apt install -y vim
apt install -y vim-common
apt install -y gnome-system-monitor
apt install -y chromium-browser
apt install -y x11-xserver-utils
apt install -y policykit-1-gnome
apt install -y overlay-scrollbar overlay-scrollbar-gtk2
apt install -y gnome-bluetooth
apt install -y libbluetooth3 libgnome-bluetooth13
apt install -y pulseaudio-module-bluetooth
apt install -y pulseaudio-module-x11
apt install -y lightdm-gtk-greeter
apt install -y lightdm-gtk-greeter-settings
apt install -y feh
apt install -y gnome-terminal
apt install -y gnome-icon-theme-full 
apt install -y git
apt install -y acpi-support
apt install -y apport-gtk
apt install -y cups cups-bsd cups-client cups-filters
apt install -y foomatic-db-compressed-ppds
apt install -y openprinting-ppds
apt install -y bluez
apt install -y bluez-cups
apt install -y hplip
apt install -y printer-driver-brlaser printer-driver-c2esp
apt install -y printer-driver-foo2zjs
apt install -y printer-driver-gutenprint
apt install -y printer-driver-hpcups
apt install -y printer-driver-min12xxw
apt install -y printer-driver-pnm2ppa
apt install -y printer-driver-postscript-hp
apt install -y printer-driver-ptouch printer-driver-pxljr
apt install -y printer-driver-sag-gdi printer-driver-splix
apt install -y system-config-printer-gnome
apt install -y indicator-printers
apt install -y python3-aptdaemon.pkcompat
apt install -y fonts-dejavu-core fonts-freefont-ttf
apt install -y fontconfig fontconfig-config
apt install -y update-inetd update-notifier
apt install -y update-notifier-common
apt install -y usb-creator-common usb-creator-gtk
apt install -y libappindicator3-1
apt install -y python-software-properties
apt install -y curl
apt install -y preload
apt install -y python2.7
apt install -y python-minimal 
apt install -y make
apt install -y gcc 
apt install -y default-jre
apt isntall -y redshift

cd /home/sean/Programs

# Theming
apt install -y lxappearance
apt install -y gtk-chtheme
apt install -y qt-qtconfig

# AWS
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python2.7 get-pip.py
sudo pip install awscli

# Redis
wget http://download.redis.io/releases/redis-5.0.3.tar.gz
tar xzf redis-5.0.3.tar.gz
cd redis-5.0.3/deps
make hiredis jemalloc linenoise lua geohash-int
cd ..
make
make install
cd ..

# Javascript stuff
sudo apt-get remove --purge nodejs
curl -s -O https://deb.nodesource.com/node_10.x/pool/main/n/nodejs/nodejs_10.9.0-1nodesource1_amd64.deb
sudo dpkg -i nodejs_10.9.0-1nodesource1_amd64.deb
sudo npm i -g gulp@4.0.0
sudo npm i -g standard
npm install -g create-react-app

# Elasticsearch
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.5.4.deb
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.5.4.deb.sha512
shasum -a 512 -c elasticsearch-6.5.4.deb.sha512
sudo dpkg -i elasticsearch-6.5.4.deb

# Set up git profile
git config --global user.name "Sean Brady"
git config --global user.email "sean.brady@stylearcade.com.au"

# GitLab Runner Box
wget -O /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64
chmod +x /usr/local/bin/gitlab-runner
useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
gitlab-runner start

# Register GitLab Runner
gitlab-runner register --non-interactive --registration-token iVaAszDwsa83Z_zYH8un --url https://gitlab.com/ --name ec2-gitlab-runner --executor shell
gitlab-runner register --non-interactive --registration-token w1_yrD36SJfoDkXww1mz --url https://gitlab.com/ --name ec2-gitlab-runner --executor shell

# Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# PPA stuff
add-apt-repository ppa:papirus/papirus
add-apt-repository ppa:tista/adapta
apt update
apt upgrade -y
apt install -y fontconfig-infinality
apt install -y papirus-icon-theme
apt install -y adapta-gtk-theme

# google chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
apt update
apt install -y google-chrome-stable

# VS Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt install -y apt-transport-https
apt update
apt install -y code # or code-insiders

# Install ZSH stuff
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
apt install -y zsh
chsh -s /usr/bin/zsh

# Copy configs
cd /home/sean/repos/setup_and_configs
cp zshrc ~/.zshrc
cp vimrc ~/.vimrc
cp preztorc ~/.zpreztorc
cp i3status_desktop ~/.i3status.conf


