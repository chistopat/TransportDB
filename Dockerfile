FROM ubuntu:18.04

ARG USERNAME=chistopat
ARG PASSWORD=password

WORKDIR '/app'
#Setup ssh server
RUN apt update && apt install openssh-server sudo -y
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ${USERNAME}
RUN echo "${USERNAME}:${PASSWORD}" | chpasswd
RUN service ssh start
EXPOSE 22

#Install cpp enviroment
RUN apt-get install -y ssh \
    build-essential \
    gcc \
    g++ \
    gdb \
    clang \
    cmake \
    rsync \
    tar \
    python \
    git \
    nano \
  && apt-get clean

#install Boost
RUN apt install -y libboost-all-dev

#Install sqlite
RUN apt install -y libsqlite3-dev

#Install SOCI
RUN git clone git://github.com/SOCI/soci.git
WORKDIR "/app/soci"
RUN mkdir build
WORKDIR "/app/soci/build"
RUN cmake -G "Unix Makefiles" -DSOCI_CXX11=ON -DWITH_BOOST=ON -DWITH_SQLITE3=ON ..
RUN make && make install

#Run SSH server
CMD ["/usr/sbin/sshd","-D"]
