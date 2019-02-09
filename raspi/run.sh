#/bin/sh



echo "run Docker image"
echo "mount /home/pi as /home/pi"
echo ""
#docker run -ti  -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix ubuntu_ros_k /bin/bash

docker run -ti --rm \
	-v /home/pi:/home/pi \
	tfpi /bin/bash
