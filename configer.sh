    echo "-------------------------------------------------------"
    
    echo "Starting Settings Configuration."
    echo "Author - NotYourBusiness"
    
    echo "-------------------------------------------------------"
    
    cd /var/www/heliactyl/
    mv settings.json settings.json.old
    cd
    echo "Heliactyl Name (Hosting Name)"
    read NAME
    echo "TimeZone (Ex: Europe/London)"
    read TZ
    echo "What is the web port? [80] (This is the port Heliactyl will run on)"
    read PORT
    echo "What is the web secret? (Used for Logins/API)"
    read WEB_SECRET
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
    
   echo" {
  "version": "12.7.0",
  "name": "$NAME",
  "letter": "H",
  "defaulttheme": "default",
  "timezone": "$TZ",
  "resources": {
    "_note": "Options: MB, GB. This is only used on the user side, admin will use GB.",
    "type": "MB"
  },
  "website": {
    "port": $PORT,
    "secret": "$WEB_SECRET"
  },
  "pterodactyl": {
    "domain": "$PTERODACTYL_DOMAIN",
    "key": "$PTERODACTYL_KEY"
  },
  "linkvertise": {
    "userid": "$LV_KEY",
    "coins": 5
  },
  "storelimits": {
    "ram": "8192",
    "disk": "10240",
    "cpu": "400",
    "servers": "8"
  },
  "stripe": {
    "enabled": false,
    "note": "The key is the stripe API key and the coins is the amount per £1. If the stripe API key is invalid and stripe purchases are enabled, Heliactyl will crash when attempting to do transactions.",
    "key": "100000000000000",
    "coins": 100
  },
  "database": "sqlite://database.sqlite",
  "api": {
    "client": {
      "api": {
        "enabled": true,
        "code": "$WEB_SECRET"
      },
      "j4r": {
        "enabled": $J4R,
        "ads": [
          {
            "name": "Example server 1",
            "invite": "https://discord.gg/example",
            "id": "000000000000000000",
            "coins": 100
          },
          {
            "name": "Example server 2",
            "invite": "https://discord.gg/example",
            "id": "000000000000000000",
            "coins": 200
          }
        ]
      },
      "bot": {
        "token": "Discord bot token here",
        "joinguild": {
          "_comment": "The Discord bot must be in these servers and have invite permissions. Automatic guild joining will not work unless role packages are configured correctly. You can always just set it to a random role & package so that only this works.",
          "enabled": false,
          "guildid": [
            "Guild ID 1"
          ]
        }
      },
      "passwordgenerator": {
        "signup": true,
        "note": "Use this to disable signups",
        "length": 16
      },
      "allow": {
        "newusers": true,
        "regen": true,
        "server": {
          "create": true,
          "modify": true,
          "delete": true
        },
        "overresourcessuspend": false
      },
      "oauth2": {
        "_comment": "Go to https://discord.dev/ and create an application to set these up.",
        "id": "$DOAUTH_ID",
        "secret": "$DOAUTH_SECRET",
        "link": "$DOAUTH_LINK",
        "callbackpath": "$DOAUTH_CALLBACKPATH",
        "prompt": true,
        "ip": {
          "trust x-forwarded-for": true,
          "block": [],
          "duplicate check": true
        }
      },
      "ratelimits": {
        "/callback": 2,
        "/create": 1,
        "/delete": 1,
        "/modify": 1,
        "/updateinfo": 1,
        "/setplan": 2,
        "/admin": 1,
        "/regen": 1,
        "/renew": 1,
        "/api/userinfo": 1
      },
      "packages": {
        "default": "default",
        "list": {
          "default": {
            "ram": 1024,
            "disk": 1024,
            "cpu": 100,
            "servers": 1
          }
        },
        "rolePackages": {
          "note": "This allows you to set a different plan to people who have a specific role however this requires the Discord bot to be configured and functioning. This is mainly used for Boost rewards",
          "roleServer": "Server ID",
          "roles": {
            "Role ID": "Package Name"
          }
        }
      },
      "locations": {
        "1": {
          "name": "Default Location 1",
          "package": null
        },
        "2": {
          "name": "Default Location 2",
          "package": null
        }
      },
      "eggs": {
       "paper": {
          "display": "Minecraft Java | Paper/Spigot",
          "minimum": {
            "ram": 1024,
            "disk": 1024,
            "cpu": 100
          },
          "maximum": {
            "ram": null,
            "disk": null,
            "cpu": null
          },
          "info": {
            "egg": 3,
            "docker_image": "ghcr.io/pterodactyl/yolks:java_17",
            "startup": "java -Xms128M -Xmx{{SERVER_MEMORY}}M -Dterminal.jline=false -Dterminal.ansi=true -jar {{SERVER_JARFILE}}",
            "environment": {
              "SERVER_JARFILE": "server.jar",
              "BUILD_NUMBER": "latest"
            },
            "feature_limits": {
              "databases": 4,
              "backups": 4
            }
          }
        },
        "bungeecord": {
          "display": "Minecraft Java | BungeeCord",
          "minimum": {
            "ram": 512,
            "disk": 512,
            "cpu": 75
          },
          "maximum": {
            "ram": null,
            "disk": null,
            "cpu": null
          },
          "info": {
            "egg": 1,
            "docker_image": "ghcr.io/pterodactyl/yolks:java_17",
            "startup": "java -Xms128M -Xmx{{SERVER_MEMORY}}M -jar {{SERVER_JARFILE}}",
            "environment": {
              "SERVER_JARFILE": "bungeecord.jar",
              "BUNGEE_VERSION": "latest"
            },
            "feature_limits": {
              "databases": 4,
              "backups": 4
            }
          }
        }
      },
      "coins": {
        "enabled": true,
        "store": {
          "_comment": "The cost and per is not intended to used with 0. This is not intended to sell resources for coins. Make sure coins are enabled too, or else there can be errors.",
          "enabled": true,
          "ram": {
            "cost": 100,
            "per": 1024
          },
          "disk": {
            "cost": 100,
            "per": 5120
          },
          "cpu": {
            "cost": 100,
            "per": 75
          },
          "servers": {
            "cost": 100,
            "per": 2
          }
        }
      }
    },
    "arcio": {
      "_comment": "This is no longer supported and will be removed in the future. The AFK page has worked without arc.io since v11.4.0.",
      "enabled": true,
      "widgetid": "none",
      "afk page": {
        "_comment": "This will not effect any current arc.io sessions, and will require a restart to kick everyone out of the websocket sesison.",
        "_comment2": "Make sure coins are enabled if you choose to enable this option!",
        "enabled": true,
        "_comment3": "If you change the path, you need to restart for it to take full effect.",
        "path": "afkwspath",
        "_comment4": "This afk page will give the users [coins variable] coins every [every variable] seconds.",
        "every": 60,
        "_comment5": "The coins variable is meant to not be under 1. There may be bugs if the coins variable is less than 1.",
        "coins": 1
      }
    }
  },
  "whitelist": {
    "note": "This allows only specific people to be able to use the dashboard",
    "status": false,
    "users": [
      "User ID"
    ]
  },
  "servercreation": {
    "note": "You can set how much it should cost to create a server here, the default price is free",
    "cost": 0
  },
  "renewals": {
    "note": "The cost is the amount of coins required to renew, and the delay is the amount of days before they need to renew. New servers after the 1st one will also cost the renewal amount. This has been fixed to suspend servers instead of deleting them as of v12.7.0.",
    "status": false,
    "cost": 0,
    "delay": 14
  },
  "logging": {
    "status": false,
    "webhook": "Webhook URL",
    "actions": {
      "user": {
        "signup": true,
        "create server": true,
        "gifted coins": true,
        "modify server": true,
        "buy servers": true,
        "buy ram": true,
        "buy cpu": true,
        "buy disk": true
      }, 
      "admin": {
        "set coins": true,
        "add coins": true,
        "set resources": true,
        "set plan": true,
        "create coupon": true,
        "revoke coupon": true,
        "remove account": true,
        "view ip": true
      }
    }
  },
  "antivpn": {
    "note": "For antivpn to work, generate an apikey on https://proxycheck.io/. If you put no key, Heliactyl will disable antivpn.",
    "status": false,
    "APIKey": "Proxycheck APIKey",
    "whitelistedIPs": ["IP address"]
  }
}
} " > /var/www/heliactyl/settings.json

    echo "-------------------------------------------------------"
    echo "Configuration Settings Completed!"
