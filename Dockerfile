FROM balenalib/raspberry-pi-debian:buster

MAINTAINER Tloxipeuhca <tloxipeuhca@gmail.com>

# Install dependencies
RUN apt-get update
RUN apt-get install -y iputils-ping tar wget wiringpi
RUN mkdir -p /root/domoticz
WORKDIR /root/domoticz
RUN wget https://releases.domoticz.com/releases/release/domoticz_linux_armv7l.tgz
RUN tar xvzf domoticz_linux_armv7l.tgz
RUN apt-get install -y cmake apt-utils build-essential
RUN apt-get install -y make gcc g++ 
RUN apt-get install -y libssl-dev git 
RUN apt-get install -y libcurl4-gnutls-dev libusb-dev 
RUN apt-get install -y software-properties-common
RUN apt-get install -y python3-dev python3-pip
RUN apt-get install -y zlib1g-dev
RUN sudo -H pip3 install requests

#Add plugins 
WORKDIR /root/domoticz/plugins
RUN git clone https://github.com/sasu-drooz/Domoticz-Zigate.git
RUN chmod +x Domoticz-Zigate/plugin.py
RUN git clone https://github.com/Smanar/Domoticz-deCONZ.git
RUN chmod +x Domoticz-deCONZ/plugin.py

#Clean up
WORKDIR /root/domoticz
RUN rm domoticz_linux_armv7l.tgz
RUN apt-get clean
RUN apt-get autoclean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose port.
EXPOSE 8094 8095 6144

# Expose GPIO
COPY gpio.sh /root/domoticz/gpio.sh
RUN chmod +x /root/domoticz/gpio.sh

# Start command
COPY start.sh /root/domoticz/start.sh
RUN chmod +x /root/domoticz/start.sh
CMD /root/domoticz/start.sh
