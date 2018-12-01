#/bin/sh

echo "start R with mxnet on docker"
echo ""

echo "for GUI xhost local:"
xhost local:
echo ""


echo "run Docker image"
echo "mount /home/yamayuu/work as /home/yamayuu/work"
echo "mount /data as /data"
echo ""
#docker run -ti  -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix ubuntu_ros_k /bin/bash

nvidia-docker run -ti --rm  -e DISPLAY=$DISPLAY \
	-v /tmp/.X11-unix/:/tmp/.X11-unix \
	-v /home/yamayuu/work/:/home/yamayuu/work \
	-v /data:/data \
	mxnet_r_cuda8_dnn5:$1
