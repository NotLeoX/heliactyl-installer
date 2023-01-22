#! /bin/sh

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

        git clone https://github.com/OpenHeliactyl/Heliactyl.git /var/www/heliactyl
	mv /var/www/heliactyl/panel/** /var/www/heliactyl
        npm install

        echo "Heliactyl is now installed, to configure it and do the nginx config please refer to: https://gitlab.com/heliactyl/panel";
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
