# rpi-domoticz-docker

Raspberry Pi Docker image containing Domoticz, GPIO, Python3, Tuya plugin, Zigate plugin and deCONZ plugin.

### Download and build the docker image
```bash
sudo apt-get install -y git
mkdir ~/downloads && cd "$_"
git clone https://github.com/Tloxipeuhca/rpi-domoticz-docker.git && cd $(basename $_ .git) && make build --no-cache
```

### Host config
```bash
# Create emtpy files
mkdir ~/docker-data
mkdir ~/docker-data/domoticz
touch ~/docker-data/domoticz/domoticz.db
touch ~/docker-data/domoticz/domoticz.log
cp gpio.sh run.sh ~/docker-data/domoticz/.

# Create a self-signed PEM file
cd ~/docker-data/domoticz
openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout key.pem -out cert.pem
cat ~/docker-data/domoticz/key.pem > ~/docker-data/domoticz/domoticz.pem
cat ~/docker-data/domoticz/cert.pem >> ~/docker-data/domoticz/domoticz.pem
rm ~/docker-data/domoticz/key.pem && rm ~/docker-data/domoticz/cert.pem
```

### How to use this image
```bash
# start standard instance
bash  ~/docker-data/domoticz/run.sh

# start gpio instance (docker privileged)
bash  ~/docker-data/domoticz/run.sh gpio

# start gpio instance and usb (docker privileged)
bash  ~/docker-data/domoticz/run.sh gpio usb

# start gpio instance and usb and zigate(docker privileged)
bash  ~/docker-data/domoticz/run.sh gpio usb zigate

# start gpio instance and usb and deCONZ(docker privileged)
bash  ~/docker-data/domoticz/run.sh gpio usb deconz
```

### Browse to portal
```
url: http://rpi-ip_address:8094 
url: https://rpi-ip_address:8095
```

### Links
+ [domoticz](http://www.domoticz.com)

