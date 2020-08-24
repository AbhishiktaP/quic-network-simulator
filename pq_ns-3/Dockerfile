FROM martenseemann/quic-network-simulator-endpoint:latest

# download and build picoquic implementation
RUN apt-get install libssl-dev
RUN apt-get -y install git
RUN git clone https://github.com/h2o/picotls.git
WORKDIR /picotls    
RUN git submodule init
RUN git submodule update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get -y install cmake
RUN apt-get -y install build-essential
RUN apt-get -y install pkg-config
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get install -y -q
RUN cmake .
RUN make

WORKDIR /
RUN git clone https://github.com/AbhishiktaP/picoquic.git
WORKDIR  /picoquic
RUN apt-get -y install faketime libscope-guard-perl libtest-tcp-perl
RUN cmake .
RUN make
#RUN make check 

# copy run script and run it
COPY run_endpoint.sh .
RUN chmod +x run_endpoint.sh
ENTRYPOINT [ "./run_endpoint.sh" ]