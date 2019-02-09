FROM resin/rpi-raspbian:stretch

MAINTAINER yamayuu

RUN echo "deb http://mirrordirector.raspbian.org/raspbian/ stretch main contrib non-free rpi firmware" > /etc/apt/sources.list

RUN apt-get update -y
RUN apt-get install -y --no-install-recommends \ 
        vim git less wget \
        build-essential \
        libatlas-base-dev \
        python3-pip python3-dev python3-setuptools\
        python3-scipy python3-h5py \
        libraspberrypi-bin \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip setuptools
RUN pip3 install rpi.gpio
RUN pip3 install numpy opencv-python
#RUN pip3 install tensorflow
RUN pip3 install pandas
#RUN pip3 install -U virtualenv 
RUN pip3 install --user --upgrade tensorflow



