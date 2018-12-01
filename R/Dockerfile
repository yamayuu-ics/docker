#FROM ubuntu:16.04
FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu16.04

# NVIDIAドライバ使うことをnvidia-dockerに教える
LABEL com.nvidia.volumes.needed="nvidia_driver"

ARG user="yamayuu"

MAINTAINER yamayuu

RUN apt-get update && apt-get upgrade -y --no-install-recommends
RUN apt-get install screen -y
RUN apt-get install -y build-essential git
RUN apt-get install -y libopenblas-dev
RUN apt-get install -y liblapack-dev
RUN apt-get install -y libopencv-dev 
RUN apt-get install software-properties-common -y

#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
#RUN add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'

#RUN apt-get -qq update
#RUN apt-get	install -y --allow-unauthenticated \
#		      libcairo2-dev \
#				libcurl4-openssl-dev \
#				libssl-dev \
#				libxml2-dev \
#				libxt-dev


# RUN apt-get update
RUN apt-get install vim -y
#RUN apt-get install apt-transport-https -y
RUN apt-get install -y x11-apps
RUN apt-get install sudo -y
#RUN apt-get install libxslt1-dev -y
# R

#RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu xenial-cran35/" | tee -a /etc/apt/sources.list
RUN echo 'deb https://cloud.r-project.org/bin/linux/ubuntu xenial-cran35/' >> /etc/apt/source.list
#RUN echo 'deb https:// cran.rstudio.com/bin/linux/ubuntu xenial/' >> /etc/apt/source.list

#RUN gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
#RUN gpg -a --export E084DAB9 | apt-key add -

RUN apt-get update
RUN apt-get install r-base -y
RUN apt-get install r-base-dev -y

RUN apt-get install gdebi-core -y
RUN apt-get install wget -y

#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
#RUN add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'

# build mxnet for R
WORKDIR /
RUN git clone --recursive -b 1.3.0 https://github.com/apache/incubator-mxnet
#RUN cd incubator-mxnet
WORKDIR /incubator-mxnet 

RUN make -j $(nproc) USE_OPENCV=1 USE_BLAS=openblas USE_CUDA=1 USE_CUDA_PATH=/usr/local/cuda USE_CUDNN=1
RUN export LD_LIBRARY_PATH=$PWD/lib
#RUN make rpkg

WORKDIR /incubator-mxnet/docs/install/

RUN set -e

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'

RUN apt-get -qq update
RUN apt-get install -y --allow-unauthenticated \
            libcairo2-dev \
            libcurl4-openssl-dev \
            libssl-dev \
            libxml2-dev \
            libxt-dev \
				r-base \
				r-base-dev


#RUN cd docs/install/
#WORKDIR /incubator-mxnet/docs/install/
RUN Rscript -e "install.packages('devtools', repo = 'https://cran.rstudio.com')"
#RUN cd ../../R-package
WORKDIR /incubator-mxnet/R-package/
RUN Rscript -e "library(devtools); library(methods); options(repos=c(CRAN='https://cran.rstudio.com')); install_deps(dependencies = TRUE)"

#RUN ls -l


#RUN echo $PWD
WORKDIR /incubator-mxnet/
#RUN echo $PWD
#RUN make rpkg
#RUN mkdir -p /usr/local/lib/R/site-library/mxnet/libs/
#RUN cp lib/* /usr/local/lib/R/site-library/mxnet/libs/

#RUN ls /usr/local/lib/R/site-library/mxnet/libs

#RUN echo $LD_LIBRARY_PATH

#RUN ln -s /usr/local/cuda/lib64/stubs/lib/libcuda.so /usr/local/cuda/lib64/libcuda.so.1

#RUN ls /usr/local/cuda/lib64

#RUN make rpkg

WORKDIR /

#COPY setup.sh /setup.sh
#RUN chmod 744 /setup.sh
#CMD ["/setup.sh"]

CMD bash -c "cd /incubator-mxnet && make rpkg && /bin/bash"
#RUN wget https://download1.rstudio.org/rstudio-xenial-1.0.153-amd64.deb

#RUN gdebi -n rstudio-xenial-1.0.153-amd64.deb

#RUN wget https://download2.rstudio.org/rstudio-server-1.1.463-amd64.deb

#RUN gdebi rstudio-server-1.1.463-amd64.deb -n


## Replace 1000 with your user / group id
#ARG uid=1000
#ARG gid=1000
#RUN groupadd -g ${uid} ${user} && \
#	useradd -u ${gid} -g ${user} -r ${user} && \
#	mkdir /home/${user} && \
#	chown ${uid}:${gid} -R /home/${user}

#USER ${user}
#WORKDIR /home/${user}


