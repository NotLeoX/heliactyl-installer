#! /bin/sh

mkdir /var/www
mkdir /var/www/heliactyl
cd /var/www/heliactyl || exit 1;

if [[ -f "/home/ubuntu/heliactyl/index.js" ]]; then
  node index.js
else
  echo "Continue installing Heliactyl? (Y/N)";
  read proceed;

  case "$proceed" in
    "Y"|"y")
        echo "Installing Heliactyl...";
	
        rm -rf /var/www/heliactyl
        git clone https://github.com/OpenHeliactyl/Heliactyl.git /var/www/heliactyl
	cd /var/www/heliactyl
        npm install

        echo "Heliactyl is now installed, Running Settings Configer";
	bash <(curl https://raw.githubusercontent.com/NotLeoX/heliactyl-installer/main/configer.sh)
        exit 0;
        ;;
    "N"|"n")
        exit 0;
        ;;
    *)
        exit 1;
        ;;
    esac
fi
