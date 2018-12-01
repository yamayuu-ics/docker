#/bin/sh

echo "start ros on docker"
echo ""

echo "for GUI xhost local:"
xhost local:
echo ""


echo "run ubuntu_ros_k Docker image"
echo "mount /home/yamayuu/work as /home/yamayuu/work"
echo ""
#docker run -ti  -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix ubuntu_ros_k /bin/bash

nvidia-docker run -ti --rm  -e DISPLAY=$DISPLAY \
	-v /tmp/.X11-unix/:/tmp/.X11-unix \
	-v /home/yamayuu/work/:/home/yamayuu/work \
	mxnet_r_cuda8_dnn5:$1
