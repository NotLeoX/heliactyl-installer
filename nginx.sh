echo "This script will setup an ssl nginx config for your heliactyl instance!" 

echo "What is the domain your heliactyl instance running on? (eg: client.heliactyl.cloud)"                                                                                                                   
read ccdomain                                                                                                                                                     
                                                                                                                                                                  
echo "What is the IP address of your server and the port the heliactyl instance is running on (Eg. 192.168.1.1:8192)"                                                                                   
read ccip                                                                                                                                                         

certbot --nginx                                                                                                                                                   

echo " server {
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
} " > /etc/nginx/sites-available/$ccdomain.conf                                                                                                                   
                                                                                                                                                                  
ln -s /etc/nginx/sites-available/$ccdomain.conf /etc/nginx/sites-enabled/$ccdomain.conf                                                                           
                                                                                                                                                                  
                                                                                                                                                                  
echo "Your reverse proxy for your heliactyl is now setup and should be available at https://$ccdomain" 
