bash /root/domoticz/gpio.sh
bash /root/domoticz/plugins/Domoticz-Zigate/Tools/pi-zigate.sh run
/root/domoticz/domoticz -www 8094 -sslwww 8095 -sslcert /root/domoticz/domoticz.pem -log /var/log/domoticz.log
