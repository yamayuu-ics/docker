#/bin/sh

echo "tensorflow on docker"
echo ""


echo "run Docker image"
echo "mount /home/yamayuu/work as /home/yamayuu/work"
echo "mount /data as /data"
echo ""
#docker run -ti  -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix ubuntu_ros_k /bin/bash

nvidia-docker run -ti --rm --net host -e DISPLAY=$DISPLAY \
	-v $HOME/.Xauthority:$HOME/.Xauthority:rw \
	-v /home/yamayuu/work/:/home/yamayuu/work \
	-v /data:/data \
	tf_1.0_monodepth
