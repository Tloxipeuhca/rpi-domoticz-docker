#!/bin/bash
declare -a gpios=(18 23 24 25 12 16 20 21)
for gpio in "${gpios[@]}"
do
  echo $gpio
  echo $gpio > /sys/class/gpio/export
  sleep 2
  echo out > /sys/class/gpio/gpio$gpio/direction
  echo 1 > /sys/class/gpio/gpio$gpio/active_low
  echo 0 > /sys/class/gpio/gpio$gpio/value
done
