#/bin/sh
cat $0

nvidia-docker run -ti --rm --net host -e DISPLAY=$DISPLAY \
	-v $HOME/.Xauthority:$HOME/.Xauthority:rw \
	-v /home/yamayuu/work/:/home/yamayuu/work \
	-v /data:/data \
	-h docker \
	tf_1.13 /bin/bash
