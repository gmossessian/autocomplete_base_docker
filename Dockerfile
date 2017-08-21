FROM python:2.7.13-slim
MAINTAINER Eli Finkelshteyn "eli@constructor.io"

# Install.
RUN apt-get -y update && apt-get install -y build-essential htop libfreetype6-dev libpng-dev python-gtk2-dev python-dev python-virtualenv git python-pip gfortran libblas-dev liblapack-dev mysql-client libmysqlclient-dev libbz2-dev libgflags-dev zlib1g-dev libsnappy-dev wget emacs
# Install lib for sparse hash
RUN wget https://github.com/Constructor-io/sparsehash/archive/sparsehash-2.0.3.tar.gz \
    && tar zvxf sparsehash-2.0.3.tar.gz \
    && cd sparsehash-sparsehash-2.0.3 \
    && ./configure \
    && make \
    && make install \
    && rm -rf /sparsehash-sparsehash-2.0.3 \
    && rm /sparsehash-2.0.3.tar.gz
# Install lib for RocksDB
RUN wget https://github.com/facebook/rocksdb/archive/v5.5.1.tar.gz \
   && tar -xvzf v5.5.1.tar.gz \
   && cd rocksdb-5.5.1 \
   && make static_lib \
   && make shared_lib \
   && make install \
   && rm -rf /rocksdb-5.5.1 \
   && rm /v5.5.1.tar.gz \
   && strip /usr/local/lib/librocksdb.a /usr/local/lib/librocksdb.so.5.5.1
# We'll need this folder in the main Dockerfile
RUN mkdir -p /usr/local/git
#first we'll add just base_requirements.txt, which contains our big, unmoving reqs so it caches
ADD ./base_requirements.txt /base_requirements.txt
RUN pip install -r /base_requirements.txt 

