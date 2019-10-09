#!/bin/bash
#var choose

#All function start
function pkg_install(){
    sudo apt-get update
    sudo apt install $1
    sudo apt install -f
}

function pkg_wget(){
    sudo apt-get update
    sudo wget $1
    sudo chmod +x $2
    sudo dpkg -i $2
    sudo apt install -f
}

function pkg_repo(){
    sudo add-apt-repository $1
    sudo apt-get update
    sudo apt-get install $2
    sudo apt install -f
}

#All function end

echo -e '\n 
 ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗ 
 ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
 ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
 ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
 ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
 ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝'
echo -e ' [+]Targeted distro: Ubuntu, Mint and other Debian based distro...\n\n'

echo -e '\t\tThis script written by : Sajidur Rahman'
echo -e '\t\t      sajidur.inbox@gmai.com\n\n'
######################################################################################

echo -e ' [1] Internet'
echo -e ' [2] Media'
echo -e '\n'

read -p ' [*] Select >> ' choose

if [ $choose -eq 1 ]
    then 
    echo -e ' [1] Firefox'
    echo -e ' [2] Chrome'
    echo -e ' [3] Chromium'
    echo -e ' [4] Opera'
    echo -e ' [5] Xtreme (Downloader like IDM)'
    echo -e ' [6] Deluge (Torrent downloader)'

    read -p ' [*] Select >> ' internet
    if [ $internet -eq 1 ]
        then 
        pkg_install firefox
    elif [ $internet -eq 2 ]
        then 
        pkg_wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb  google-chrome-stable_current_amd64.deb
    elif [ $internet -eq 3 ]
        then 
        pkg_install chromium-browser
    elif [ $internet -eq 4 ]
        then
        pkg_wget https://download3.operacdn.com/pub/opera/desktop/63.0.3368.94/linux/opera-stable_63.0.3368.94_amd64.deb opera-stable_63.0.3368.94_amd64.deb 
    elif [ $internet -eq 5 ]
        then 
        echo -e ' [-] Under construction this feature.'
        sudo apt-get update
        sudo apt install xz-utils
        sudo wget https://netcologne.dl.sourceforge.net/project/xdman/xdm-2018-x64.tar.xz
        rm -r xdm
        mkdir xdm
        mv xdm-2018-x64.tar.xz xdm
        cd xdm
        tar -xf xdm-2018-x64.tar.xz
        sudo chmod +x ./install.sh
        sudo ./install.sh
        cd ..
        echo finished
        
    elif [ $internet -eq 6 ]
        then 
        pkg_repo ppa:deluge-team/stable deluge
    fi

fi

#For restart
clear
./installer.sh
