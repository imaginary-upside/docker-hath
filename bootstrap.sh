#!/bin/sh
if [ ! -f /opt/hentai/data/client_login ]; then
  mkdir -p /opt/hentai/data
  echo -n "$CLIENT_ID"-"$CLIENT_KEY" >> /opt/hentai/data/client_login
fi

java -jar /opt/hentai/HentaiAtHome.jar
