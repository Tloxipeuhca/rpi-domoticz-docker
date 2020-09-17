# rpi-domoticz-docker

Docker image containing Domoticz who is compatible with Raspberry Pi.

### Download and build the docker image
```bash
sudo apt-get install -y git
mkdir ~/downloads && cd "$_"
git clone https://github.com/Tloxipeuhca/rpi-rclone-docker.git && cd $(basename $_ .git) && make build
```

### Host config
```bash
# Create emtpy files
mkdir ~/docker-data && cd "$_"
mkdir ~/docker-data/domoticz && cd "$_"
touch ~/docker-data/domoticz/domoticz.db
touch ~/docker-data/domoticz/domoticz.log
cp gpio.sh run.sh run-with-gpio.sh ~/docker-data/domoticz/.

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
sh  ~/docker-data/domoticz/run.sh
# start gpio instance (docker privileged)
sh  ~/docker-data/domoticz/run-with-gpio.sh
```

### Browse to portal
```
url: rpi-ip_address:8094 
```

### Links
+ [domoticz](http://www.domoticz.com)

