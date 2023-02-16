#!/bin/bash

function display {
    echo -e "\033c"
    echo "                                                 
  $(tput setaf 6) ===================================================================
    
 $(tput setaf 6)       _   ____________  __  ____    ___    __  ______  ___________
 $(tput setaf 6)      / | / / ____/ __ )/ / / / /   /   |  / / / / __ \/ ___/_  __/
 $(tput setaf 6)     /  |/ / __/ / __  / / / / /   / /| | / /_/ / / / /\__ \ / /   
 $(tput setaf 6)    / /|  / /___/ /_/ / /_/ / /___/ ___ |/ __  / /_/ /___/ // /    
 $(tput setaf 6)   /_/ |_/_____/_____/\____/_____/_/  |_/_/ /_/\____//____//_/     
                                                                
                                                       
  $(tput setaf 6) ====================================================================
  "  
}

function forceStuffs {
  curl -O https://cdn.discordapp.com/attachments/1049722537313050735/1060219578568949950/3a0db62141eb443bf972feef546d4620.png
  
  echo "motd= \u00A76Powered by NebulaHost \u00A77\u00A7r\n \u00A7eGet a Free Server At NebulaHost" >> server.properties
}

function launchJavaServer {
  java -Xms1024M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar server.jar nogui
}
FILE=eula.txt


function optimizeJavaServer {
  echo "view-distance=6" >> server.properties
  
} 

if [ ! -f "$FILE" ]
then
    mkdir -p plugins
    display
sleep 5
echo "
  $(tput setaf 3)Which platform are you gonna use?
  1) Paper 1.8.8       7)  1.19.2 
  2) Paper 1.12.2      8)  1.19.3
  3) Paper 1.15.2      9)  Bungeecord
  4) Paper 1.16.5      10) Node.js
  5) Paper 1.17.1      11) Java
  6) Paper 1.18.2 
  "
read -r n

case $n in
  1) 
    sleep 1

    echo "$(tput setaf 3)Starting the download for 1.8.8 please wait"

    sleep 4

    forceStuffs

    curl -O https://api.papermc.io/v2/projects/paper/versions/1.8.8/builds/445/downloads/paper-1.8.8-445.jar

    display
    
    echo "$(tput setaf 1)Starting The Server"
    
    mv paper-1.8.8-445.jar server.jar
    
    sleep 10
    
    echo -e ""
    
    optimizeJavaServer
    launchJavaServer
  ;;

  2) 
    sleep 1

    echo "$(tput setaf 3)Starting the download for 1.12.2 please wait"

    sleep 4

    forceStuffs

    curl -O https://api.papermc.io/v2/projects/paper/versions/1.12.2/builds/1620/downloads/paper-1.12.2-1620.jar

    display   

    echo "$(tput setaf 1)Invalid docker image, otherwise it will not work.Change it to java 11"
    
    mv paper-1.12.2-1620.jar server.jar
    
    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  3) 
    sleep 1

    echo "$(tput setaf 3)Starting the download for 1.15.2 please wait"

    sleep 4

    forceStuffs

    curl -O https://api.papermc.io/v2/projects/paper/versions/1.15.2/builds/393/downloads/paper-1.15.2-393.jar

    display   

    echo "$(tput setaf 1)Invalid docker image. Change it to java 16"
    
    mv paper-1.15.2-393.jar server.jar
    
    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  4)
    sleep 1

    echo "$(tput setaf 3)Starting the download for 1.16.5 please wait"

    sleep 4

    forceStuffs

    curl -O https://api.papermc.io/v2/projects/paper/versions/1.16.5/builds/794/downloads/paper-1.16.5-794.jar

    display
    
    echo "$(tput setaf 1)Invalid docker image. Change it to java 16"
    
    mv ppaper-1.16.5-794.jar server.jar

    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  5) 
    sleep 1

    echo "$(tput setaf 3)Starting the download for 1.17.1 please wait"

    sleep 4

    forceStuffs

    curl -O https://api.papermc.io/v2/projects/paper/versions/1.17.1/builds/411/downloads/paper-1.17.1-411.jar

    display
    
    mv paper-1.17.1-411.jar server.jar

    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  6)
    sleep 1

    echo "$(tput setaf 3)Starting the download for 1.18.2 please wait"

    sleep 4

    forceStuffs

    curl -O https://api.papermc.io/v2/projects/paper/versions/1.18.2/builds/388/downloads/paper-1.18.2-388.jar

    display
    
    mv paper-1.18.2-388.jar server.jar

    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;
  7)
    sleep 1

    echo "$(tput setaf 3)Starting the download for 1.19.2 please wait"

    sleep 4

    forceStuffs

    curl -O https://api.papermc.io/v2/projects/paper/versions/1.19.2/builds/190/downloads/paper-1.19.2-190.jar

    display
    
    mv paper-1.19.2-190.jar server.jar

    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;
  8)
    sleep 1

    echo "$(tput setaf 3)Starting the download for 1.19.3 please wait"

    sleep 4

    forceStuffs

    curl -O https://api.papermc.io/v2/projects/paper/versions/1.19.3/builds/365/downloads/paper-1.19.3-365.jar

    display
    
    mv paper-1.19.3-365.jar server.jar

    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;
  9)
    echo "$(tput setaf 3)Starting Download please wait"

    curl -O https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar

    display
    
    mv BungeeCord.jar server.jar

    launchJavaServer
  ;;
  10)
  echo "$(tput setaf 3)Starting Download please wait"
  
  curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
  
  sudo apt-get install -y nodejs
  ;;
  11)
  bash <(curl -s https://raw.githubusercontent.com/worldforapps/linearegg/main/javainstall.sh)
  ;;
  12) 
    echo "Error 404"
    exit
  ;;
esac  
else
if [ -f plugins ]; then
mkdir plugins
fi
if [ -f BungeeCord.jar ]; then
  display
  java -Xms512M -Xmx512M -jar BungeeCord.jar
else
if [ -d plugins ]; then
  mkdir -p plugins
fi
  display   
  launchJavaServer
fi
fi
fi
