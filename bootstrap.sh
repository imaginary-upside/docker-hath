#!/bin/sh
if [ ! -f /opt/hath/data/client_login ]; then
  mkdir -p /opt/hath/data
  echo -n "$CLIENT_ID"-"$CLIENT_KEY" >> /opt/hath/data/client_login
fi

java -jar /opt/hath/HentaiAtHome.jar
