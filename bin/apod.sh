#!/bin/bash

APOD_URL="https://apod.nasa.gov/apod"
BACKGROUND_PATH="/home/pawel/background.jpg"

if [ -f ${BACKGROUND_PATH} ]; then
    swaymsg output "*" bg ${BACKGROUND_PATH} fill
fi
curl -s ${APOD_URL}/astropix.html | grep -oP "\"(.*)\.jpg\"" | \
    head -n1 | \
    xargs -I{} curl --silent --output ${BACKGROUND_PATH} ${APOD_URL}/{} && \
    swaymsg output "*" bg ${BACKGROUND_PATH} fill
