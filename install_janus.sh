sudo apt-get update

sudo apt-get --assume-yes install -y \
    git \
    pkg-config \
    build-essential \
    clang \
    libapr1-dev libaprutil1-dev \
    libyaml-cpp-dev \
    libjemalloc-dev \
    python3-dev \
    python-dev \
    python3-pip \
    python3-wheel \
    python3-setuptools \
    libgoogle-perftools-dev

sudo pip3 install mpi

cd ~
wget https://boostorg.jfrog.io/artifactory/main/release/1.70.0/source/boost_1_70_0.tar.bz2
tar -xvf boost_1_70_0.tar.bz2
cd boost_1_70_0/
./bootstrap.sh  --prefix=/usr/local --libdir=/usr/lib/x86_64-linux-gnu
sudo ./b2 install -j8