    echo "-------------------------------------------------------"
    
    echo "Starting Settings Configuration."
    echo "Author - NotLeoX and MR Sharma"
    
    echo "-------------------------------------------------------"
    
    cd /var/www/heliactyl/
    rm settings.json 
    cd
    echo "Heliactyl Name (Hosting Name)"
    read NAME
    echo "TimeZone (Ex: Europe/London)"
    read TZ
    echo "What is the web port? [80] (This is the port Heliactyl will run on)"
    read PORT
    echo "What is the web secret? (Used for Logins/API)"
    read WS
    echo "What is the pterodactyl domain? [https://panel.yourdomain.com]"
    read PTERODACTYL_DOMAIN
    echo "What is the pterodactyl key?"
    read PTERODACTYL_KEY
    echo "What is the linkvertise id? (go to https://publisher.linkvertise.com and get one)"
    read LV_KEY
    echo "Enable J4R? (True / False)"
    read J4R
    echo "What is the Discord Oauth2 ID?"
    read DOAUTH_ID
    echo "What is the Discord Oauth2 Secret?"
    read DOAUTH_SECRET
    echo "What is the Discord Oauth2 Link? (https://dash.urdomain.com)"
    read DOAUTH_LINK
    echo "What is the Callback path? [callback]" 
    read DOAUTH_CALLBACKPATH
    echo "Prompt [TRUE/FALSE] (When set to true users wont have to relogin after a session)"
    read DOAUTH_PROMPT
    
    sed -i -e "s@$NAME@${NAME}@g" /var/www/heliactyl/settings.json
    sed -i -e "s@$TZ@${TZ}@g" /var/www/heliactyl/settings.json
    sed -i -e "s@$WS@${WS}@g" /var/www/heliactyl/settings.json
    sed -i -e "s@$PTERODACTYL_DOMAIN@${PTERODACTYL_DOMAIN}@g" /var/www/heliactyl/settings.json
    sed -i -e "s@$PTERODACTYL_KEY@${PTERODACTYL_KEY}@g" /var/www/heliactyl/settings.json
    sed -i -e "s@$LV_KEY@${LV_KEY}@g" /var/www/heliactyl/settings.json
    sed -i -e "s@$J4R@${J4R}@g" /var/www/heliactyl/settings.json
    sed -i -e "s@$DOUTH_ID@${DOAUTH_ID}@g" /var/www/heliactyl/settings.json
    sed -i -e "s@$DOAUTH_SECRET@${DOAUTH_SECRET}@g" /var/www/heliactyl/settings.json
    sed -i -e "s@$DOAUTH_LINK@${DOAUTH_LINK}@g" /var/www/heliactyl/settings.json
    sed -i -e "s@$DOAUTH_CALLBACKPATH@${DOAUTH_CALLBACKPATH}@g" /var/www/heliactyl/settings.json
    sed -i -e "s@$DOAUTH_PROMPT@${DOAUTH_PROMPT}@g" /var/www/heliactyl/settings.json
    
    echo "-------------------------------------------------------"
    echo "Configuration Settings Completed!"
