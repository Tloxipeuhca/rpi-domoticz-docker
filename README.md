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

### How to use this image
```
sudo docker run --privileged \
        -d \
        --network=host \
        --device=/dev/ttyAMA0 \
        --device=/dev/ttyUSB0 \
        --device=/dev/vchiq \
        -e LD_LIBRARY_PATH=/opt/vc/lib  \
        -v /opt/vc:/opt/vc:ro \
        -v /etc/localtime:/etc/localtime \
        -v $HOME/docker-data/domoticz/domoticz-rfxcom.db:/root/domoticz/domoticz.db:rw \
        -v $HOME/docker-data/domoticz/server_cert.pem:/root/domoticz/server_cert.pem:rw \
        -v $HOME/docker-data/domoticz/log.txt:/tmp/domoticz.txt:rw \
        --name domoticz \
        --restart=always \
        tloxipeuhca/rpi-domoticz-docker
```

### Links
+ [domoticz](http://www.domoticz.com)
