FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu16.04

# NVIDIAドライバ使うことをnvidia-dockerに教える
LABEL com.nvidia.volumes.needed="nvidia_driver"

ARG user="yamayuu"

MAINTAINER yamayuu

RUN apt-get update && apt-get upgrade -y --no-install-recommends
RUN apt-get install screen -y
RUN apt-get install -y build-essential git
RUN apt-get install -y libopenblas-dev
RUN apt-get install -y liblapack-dev
RUN apt-get install -y libopencv-dev 
RUN apt-get install software-properties-common -y
RUN apt-get install vim -y
RUN apt-get install -y x11-apps
RUN apt-get install sudo -y
RUN apt-get install wget -y

## python
RUN apt-get install python3-dev -y
RUN apt-get install python3-setuptools -y
RUN apt-get install python3-pip -y
RUN apt-get install python3-scipy -y
RUN apt-get install python3-h5py -y
RUN apt-get install python3-tk -y

RUN apt-get clean
RUN rm -rf /var/lib/apt/list/*

#RUN pip3 install --upgrade pip3 setuptools
RUN pip3 install numpy 
RUN pip3 install opencv-python==3.4.5.20
RUN pip3 install tensorflow-gpu==1.0
RUN pip3 install keras
RUN pip3 install matplotlib
RUN pip3 install pillow


## make user
## Replace 1000 with your user / group id
ARG uid=1000
ARG gid=1000
RUN groupadd -g ${uid} ${user} && \
	useradd -u ${gid} -g ${user} -r ${user} && \
	mkdir /home/${user} && \
	chown ${uid}:${gid} -R /home/${user}

USER ${user}
WORKDIR /home/${user}


