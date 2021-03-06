#!/bin/bash

if [ ! -f "artisan" ]; then
    echo "Could not find the Artisan file, this normally means you are not in the correct directory! Please go to the root installation of your panel and re-run this script! Thanks"

    else

    echo "You seem to be in the right directory! Woohoo!!"
    sleep 2

    apt install git zip -y

    echo "Backing up previous panel files in the case that something goes wrong!"
    zip -r PanelBackup-$(date +"%Y-%m-%d %H-%M-%S").zip public resources

    echo "Downloading the Theme you picked"
    mkdir -p tempdown && cd tempdown && git clone https://github.com/TheFonix/Pterodactyl-Themes.git . 
    cp -r Dark-V1.0/public .. 
    cp -r Dark-V1.0/resources .. 

    echo "Files have been copied over!"
    sleep 2

    

    


cd .. && rm -rf tempdown

echo "Let me just clean up those permissions"
chmod -R 755 storage/* bootstrap/cache/
chown -R www-data:www-data * 

    echo "Complete! Have a good day and dont forget to refresh your browser cache!"
    echo "Fonix"
fi
