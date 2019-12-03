#/bin/sh
cat $0

nvidia-docker run -ti --rm --net host -e DISPLAY=$DISPLAY \
	-v $HOME/.Xauthority:$HOME/.Xauthority:rw \
	-v /home/yamayuu/work/:/home/yamayuu/work \
	-v /mnt:/mnt \
	tf_2.0 /bin/bash
