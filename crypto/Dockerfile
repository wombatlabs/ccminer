FROM ubuntu:24.04
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y && \
    apt-get install libcurl4 libcurl4-openssl-dev \
    libssl-dev \
    libjansson-dev \
    automake \
    autotools-dev \
    build-essential \
    git \
    wget \
    nvidia-driver-570 \    
    -y 
RUN wget wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-ubuntu2404.pin
RUN mv cuda-ubuntu2404.pin /etc/apt/preferences.d/cuda-repository-pin-600
RUN wget https://developer.download.nvidia.com/compute/cuda/12.8.0/local_installers/cuda-repo-ubuntu2404-12-8-local_12.8.0-570.86.10-1_amd64.deb
RUN dpkg -i cuda-repo-ubuntu2404-12-8-local_12.8.0-570.86.10-1_amd64.deb
RUN cp /var/cuda-repo-ubuntu2404-12-8-local/cuda-*-keyring.gpg /usr/share/keyrings/
RUN apt-get update
RUN apt-get -y install cuda-toolkit-12-8 cuda-cudart-12-8 libnvidia-compute-570
RUN rm *.deb
RUN ldconfig
RUN git clone https://github.com/Zero-Dynamics/ccminer
WORKDIR ccminer
RUN git checkout master
RUN ./build.sh
RUN strip -s ccminer
RUN make install
RUN make clean
#RUN ccminer --version
RUN apt-get remove -y libcurl4-openssl-dev libssl-dev libjansson-dev
#ENTRYPOINT [ "./ccminer" ]