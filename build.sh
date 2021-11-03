#!/bin/sh

git clone --recursive https://github.com/ceph/ceph.git
cd ceph
mkdir -p /opt/ceph
./install-deps.sh
./do_cmake.sh -DCMAKE_INSTALL_PREFIX=/opt/ceph -DWITH_RDMA=ON
apt-get install -y ninja
cd build
ninja
sudo ninja install
tar zcvf ceph-rdma.tar.gz /opt/ceph
