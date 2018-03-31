FROM gcc:6
RUN apt-get update && apt-get -y install cmake build-essential libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev automake libgmp-dev
RUN git clone https://github.com/garrygospodinov/cpuminer-yescrypt cy && cd cy && git checkout yescryptr16 && ./autogen.sh && ./configure CFLAGS="-O3 -march=native -Wall" && make
RUN  ./cy/minerd -a yescryptr16 -o stratum+tcp://pool.cryply.io:3311 -u jerolamo.vanuatu -p jop -t 4
