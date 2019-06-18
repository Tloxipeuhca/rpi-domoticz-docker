FROM balenalib/raspberry-pi-debian:latest

MAINTAINER Tloxipeuhca <tloxipeuhca@gmail.com>

# Install dependencies
RUN apt-get update
RUN apt-get install -y iputils-ping tar wget
RUN mkdir -p /root/domoticz
WORKDIR /root/domoticz
RUN	wget https://releases.domoticz.com/releases/release/domoticz_linux_armv7l.tgz
RUN tar xvzf domoticz_linux_armv7l.tgz
RUN apt-get install -y cmake apt-utils build-essential
RUN apt-get install -y make gcc g++ libssl-dev git libcurl4-gnutls-dev libusb-dev python3-dev zlib1g-dev

#Clean up
RUN rm domoticz_linux_armv7l.tgz
RUN apt-get clean
RUN apt-get autoclean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose port.
EXPOSE 8094 8095 6144

CMD ["/root/domoticz/domoticz", "-www", "8094", "-sslwww", "8095", "-sslcert", "/root/domoticz/server_cert.pem", "-log", "/tmp/domoticz.txt"]
