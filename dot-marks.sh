## ppa prereq
mk11(){
    ## common tools (e.g., add-apt-repository)
    sudo apt install -y software-properties-common
}

# basics
mk31() {
    # tree - file structure diagrams
    # nano/pico - text editor
    # zip - file archiver
    # unzip - file unarchiver
    # python3-pip: pip module manager
    sudo apt install -y tree nano zip unzip
#    sudo apt install python3-pip -y ## no longer a thing after Debian 12? (PEP 668)
    sudo apt install -y python3-pil python3-tk python3-qrcode
    sudo apt install -y python3-scipy python3-plotly python3-notebook pandas
}

## php 8.2
mk32() {
    # php8.2: core, including built-in web server
    # php8.2-curl: curl extensions
    # php8.2-xml: xml extensions
    # php8.2-sqlite3: sqlite3 extensions
    # php8.2-intl: international functions
    # php8.2-gd: graphics library
    # sqlite3: sqlite cli for bash, ksh, etc.
    sudo apt install php8.2 php8.2-curl php8.2-xml php8.2-sqlite3 php8.2-gd php8.2-intl -y
    sudo apt install sqlite3 -y
}

## node
mk33() {

    ## node 21.x
    ## using command from nodesource
    ## https://github.com/nodesource/distributions
    curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - &&\
    sudo apt-get install -y nodejs

    # node and package manager
    sudo apt install nodejs -y
    sudo apt install npm -y
}

## databoss (many databases)
mk34() {
    echo 'databoss'
}

## mediapack
mk35() {
    sudo apt install ffmpeg -y
}

## devops
mk51() {

    # java 17
    sudo apt install openjdk-17-jdk -y

    ## node install
    mk33

    # ruby for building ghpages, homebrew etc.
    sudo apt install ruby -y

    ## includes 'dig' for domains
    sudo apt install dnsutils -y
}

## homebrew + ruby
mk52() {
    sudo apt install ruby -y
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

## rebrews alternative homebrew installs
rebrew() {
    eval "$(homebrew/bin/brew shellenv)"
    brew update --force --quiet
    chmod -R go-w "$(brew --prefix)/share/zsh"
}

## design
mk81() {
    ## freecad
    sudo apt install freecad -y
}

## libreoffice
mk88() {
    mk11
    upd
    sudo add-apt-repository ppa:libreoffice/ppa
    upd
    sudo apt install libreoffice -y
}

## makerware
mk89() {
    bash 'makerspace'
}

## legacy
mk95() {
    # text-based web browser
    sudo apt install lynx -y
}

### EXTRAS

## apache-cordova
mk91 () {
    mk11
    upd
    sudo apt-add-repository ppa:cordova-ubuntu/ppa
    upd
    sudo apt install cordova-cli
}

## gh pages local
mk92 () {
    upd
    sudo apt-get install ruby-full build-essential zlib1g-dev -y
    gem install jekyll bundler
    bundle init
    echo 'gem "jekyll"' >> Gemfile
    bundle
    bundle exec jekyll serve
}

# dotnet
mk93() {
    wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb
    rm packages-microsoft-prod.deb
    sudo apt-get update
    sudo apt-get install -y dotnet-sdk-7.0

    ## post-install test
    ## $ mkdir vb
    ## $ cd vb
    ## $ dotnet new console -lang "VB"
    ## $ dotnet run ## Hello World!

    ## building executable
    ## using solution found here:
    ## https://stackoverflow.com/a/55374055
    ## $ dotnet build -c Release -r debian.8-x64 --self-contained
    ## $ dotnet build -c Release -r debian.11-x64 --self-contained
}

## rustlang
mk94() {
    ## rust
    ## https://www.rust-lang.org/tools/install
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}
