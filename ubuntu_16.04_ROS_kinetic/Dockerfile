#FROM ubuntu:16.04
FROM nvidia/cuda:latest

# NVIDIAドライバ使うことをnvidia-dockerに教える
LABEL com.nvidia.volumes.needed="nvidia_driver"

ARG user="yamayuu"

MAINTAINER yamayuu

RUN apt-get update && apt-get upgrade -y && apt-get install -y x11-apps
RUN apt-get install screen -y

# RUN apt-get update
RUN apt-get install vim -y
# RUN apt-get install -y x11-apps

						  

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu xenial main" > /etc/apt/sources.list.d/ros-latest.list'

RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

RUN apt-get update

RUN apt-get install ros-kinetic-desktop-full -y

RUN rosdep init
RUN rosdep update

RUN apt-get install python-rosinstall -y

RUN apt-get install ros-kinetic-kobuki-gazebo -y
RUN apt-get install ros-kinetic-turtlebot-gazebo -y
RUN apt-get install ros-kinetic-rqt-ez-publisher -y


# Replace 1000 with your user / group id
ARG uid=1000
ARG gid=1000
RUN groupadd -g ${uid} ${user} && \
	useradd -u ${gid} -g ${user} -r ${user} && \
	mkdir /home/${user} && \
	chown ${uid}:${gid} -R /home/${user}

USER ${user}
WORKDIR /home/${user}

RUN echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
#RUN source ~/.bashrc

