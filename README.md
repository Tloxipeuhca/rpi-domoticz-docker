# rpi-domoticz-docker

Docker image containing Domoticz that is compatible with Raspberry Pi.

### Build the Docker Image
```bash
make build
```

### Run the Docker Image and get version of installed RCLONE
```bash
make version
```

### Push Docker Image to Docker Hub
* First, use a `docker login` with username, password and email address
* Second, push Docker Image to the official Docker Hub
```bash
make push
```

### Host config
```bash
# Create emtpy files
mkdir ~/docker-data && cd "$_"
mkdir ~/docker-data/domoticz && cd "$_"
touch ~/docker-data/domoticz/domoticz.db
touch ~/docker-data/domoticz/domoticz.log

# Create a self-signed PEM file
openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout key.pem -out cert.pem
cat ~/docker-data/domoticz/key.pem > ~/docker-data/domoticz/domoticz.pem
cat ~/docker-data/domoticz/cert.pem >> ~/docker-data/domoticz/domoticz.pem
rm ~/docker-data/domoticz/key.pem && rm ~/docker-data/domoticz/cert.pem
```

### How to use this image
```bash
# start standard instance
sh run.sh
# start gpio instance (docker privileged)
sh run-with-gpio.sh
```

### Links
+ [domoticz](http://www.domoticz.com)

