# Start with ubuntu 18.04 image
FROM ubuntu:18.04

# Update packages and install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    wget \
    python3 \
    python3-pip \
    libboost-all-dev \
    libtool \
    automake \
    subversion \
    g++ \
    zlib1g-dev

# Install Moses
RUN git clone https://github.com/moses-smt/mosesdecoder.git
RUN cd mosesdecoder && git checkout master && ./bjam -j8

# Install KenLM for language model
RUN wget -O - https://kheafield.com/code/kenlm.tar.gz | tar xz 
RUN cd kenlm && mkdir -p build && cd build && cmake .. && make -j 8

# Install SRILM
RUN git clone https://github.com/sourceforge/srilm.git
RUN cd srilm && ./configure && make && make install

# Install Python dependencies
COPY requirements.txt .
RUN pip3 install -r requirements.txt

# Set environment variables
ENV PATH="/root/mosesdecoder/build:$PATH"
ENV PATH="/root/kenlm/build:$PATH" 
ENV PATH="/root/srilm/bin/i686-m64:$PATH"