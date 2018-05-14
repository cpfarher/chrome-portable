#!/bin/sh
docker build -t chrome:62.0.3202.75 .
docker run -d -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:rw chrome:62.0.3202.75
