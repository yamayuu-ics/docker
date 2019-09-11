#/bin/sh
cat $0

docker run --runtime=nvidia  -ti --rm --net host -e DISPLAY=$DISPLAY \
	-v $HOME/.Xauthority:$HOME/.Xauthority:rw \
	-v /home/yamayuu/work/:/home/yamayuu/work \
	-v /data:/data \
	-h docker \
	tflite /bin/bash
