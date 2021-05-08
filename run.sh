#!/bin/bash

[[ "$@" =~ 'usb' || "$@" =~ 'usb0' ]] && usb0="--device=/dev/ttyUSB0"
[[ "$@" =~ 'usb1' ]] && usb1="--device=/dev/ttyUSB1"
[[ "$@" =~ "zigate" || "$@" =~ "gpio" ]] && privileged="--privileged"

run="sudo docker run \
        -d \
	$privileged \
        --network=host \
	$usb0 \
	$usb1 \
        --device=/dev/ttyAMA0 \
        --device=/dev/vchiq \
        -e LD_LIBRARY_PATH=/opt/vc/lib  \
        -v /opt/vc:/opt/vc:ro \
        -v /etc/localtime:/etc/localtime \
        -v $HOME/docker-data/domoticz/domoticz.db:/root/domoticz/domoticz.db:rw \
        -v $HOME/docker-data/domoticz/domoticz.pem:/root/domoticz/domoticz.pem:rw \
        -v $HOME/docker-data/domoticz/domoticz.log:/var/log/domoticz.log:rw \
        --name domoticz \
        --restart=always \
        tloxipeuhca/rpi-domoticz-docker"

echo $run
eval $run
