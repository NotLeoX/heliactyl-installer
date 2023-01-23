echo "This Script Will Config Your Heliactyl Nginx Configuration" 

echo "Domain Your Heliactyl is Running on? (eg: client.heliactyl.cloud)"                                                                                                                   
read ccdomain     
                                                                                                                                                                  
echo "IP and Port of Your Heliactyl Instance (Eg. 192.168.1.1:8192)"                                                                                   
read ccip                                                                                                                                                         

echo "Email For SSL"                                                                                                                   
read ccemail  

 certbot --nginx --redirect --no-eff-email --email "@ccemail" -d "$ccdomain"                                                                                                                                                 

echo "server {
    listen 80;
    server_name $ccdomain;
    return 301 https://$server_name$request_uri;
}
server {
    listen 443 ssl http2;
location /afkwspath {
  proxy_http_version 1.1;
  proxy_set_header Upgrade $http_upgrade;
  proxy_set_header Connection "upgrade";
  proxy_pass "http://$ccip/afkwspath";
}
    
    server_name $ccdomain;
ssl_certificate /etc/letsencrypt/live/$ccdomain/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/$ccdomain/privkey.pem;
    ssl_session_cache shared:SSL:10m;
    ssl_protocols SSLv3 TLSv1 TLSv1.1 TLSv1.2;
    ssl_ciphers  HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;
location / {
      proxy_pass http://$ccip/;
      proxy_buffering off;
      proxy_set_header X-Real-IP $remote_addr;
  }
}
} " > /etc/nginx/sites-available/$ccdomain.conf                                                                                                                   
                                                                                                                                                                  
ln -s /etc/nginx/sites-available/$ccdomain.conf /etc/nginx/sites-enabled/$ccdomain.conf                                                                           
                                                                                                                                                                  
                                                                                                                                                                  
echo "Your Heliactyl Nginx Config is Setuped Should be Available at https://$ccdomain" 
