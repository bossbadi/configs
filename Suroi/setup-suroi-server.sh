#!/bin/bash
# Script to install a single Suroi.io server

setup_server() {
    # download pm2 config
    cd /apps/suroi-$1/
    curl -O https://raw.githubusercontent.com/bossbadi/configs/master/pm2/suroi-server-1/ecosystem.config.js
    sed -i "s/1/$1/g" ecosystem.config.js

    # download server config
    cd server/src/
    curl -O https://raw.githubusercontent.com/bossbadi/configs/master/Suroi/server-$1/config.ts
    curl -O https://raw.githubusercontent.com/bossbadi/configs/master/Suroi/server-$1/map.ts
    cd data/
    curl -O -f -s https://raw.githubusercontent.com/bossbadi/configs/master/Suroi/server-$1/data/maps.ts
    curl -O -f -s https://raw.githubusercontent.com/bossbadi/configs/master/Suroi/server-$1/data/lootTables.ts
    cd ../objects/
    curl -O -f -s https://raw.githubusercontent.com/bossbadi/configs/master/Suroi/server-$1/objects/bullet.ts
    curl -O -f -s https://raw.githubusercontent.com/bossbadi/configs/master/Suroi/server-$1/objects/throwableProj.ts

    # build server
    cd /apps/suroi-$1/server/
    pnpm install
    pnpm build

    # start server
    cd /apps/suroi-$1/
    pm2 start
}

num=$1

if ! [[ $num =~ ^[0-9]+$ ]]; then
    echo "Error: first argument must be a number"
    exit 1
fi

setup_server $num
