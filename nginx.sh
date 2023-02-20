echo "This Script Will Config Your Heliactyl Nginx Configuration" 

echo "Domain Your Heliactyl is Running on? (eg: client.heliactyl.cloud)"                                                                                                                   
read ccdomain     
                                                                                                                                                                  
echo "IP and Port of Your Heliactyl Instance (Eg. 192.168.1.1:8192)"                                                                                   
read ccip                                                                                                                                                         

echo "Email For SSL"                                                                                                                   
read ccemail  

 certbot --nginx --redirect --no-eff-email --email "@$ccemail" -d "$ccdomain"                                                                                                                                                 

 sed -i -e "s@$ccdomain@${FQDN}@g" /etc/nginx/sites-available/$ccdomain.conf    
 sed -i -e "s@$ccip@${IP}@g" /etc/nginx/sites-available/$ccdomain.conf 
                                                                                                                                                                  
ln -s /etc/nginx/sites-available/$ccdomain.conf /etc/nginx/sites-enabled/$ccdomain.conf                                                                           
                                                                                                                                                                  
                                                                                                                                                                  
echo "Your Heliactyl Nginx Config is Setuped Should be Available at https://$ccdomain" 
