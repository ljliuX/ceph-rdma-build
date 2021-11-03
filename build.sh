#!/bin/sh

git clone --recursive https://github.com/ceph/ceph.git
cd ceph
./install-deps.sh
./do_cmake.sh -DCMAKE_INSTALL_PREFIX=/usr/local -DWITH_RDMA=ON
cd build
ninja
sudo ninja install
tar zcvf ceph-rdma.tar.gz /usr/local
