Dockerfile to build ubuntu with ROS


Content of this container image:

OS		:ubuntu 16.04

ROS	:kinetik-desktop-full

befoer you build file,change user name.

build command:

docker build -t ubuntu_ros_k .

you can modify image name.(ubuntu_ros_k)

run script:

./ros_run.sh
