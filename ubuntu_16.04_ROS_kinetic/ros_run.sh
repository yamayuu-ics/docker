#!/bin/sh

echo "start ros on docker"
echo ""



echo "run ubuntu_ros_k Docker image"
echo "mount /home/yamayuu/work as /home/yamayuu/work"
echo ""
#docker run -ti  -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix ubuntu_ros_k /bin/bash

nvidia-docker run -ti --rm --net host  -e DISPLAY=$DISPLAY \
	-v $HOME/.Xauthority:$HOME/.Xauthority:rw \
	-v /home/yamayuu/work/:/home/yamayuu/work \
	ubuntu16.04_ros_k /bin/bash
