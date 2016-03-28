FROM cern/cc7-base
MAINTAINER Steve Farrell <Steven.Farrell@cern.ch>

# Basic update and development tools
RUN yum update -y && \
    yum install -y gcc gcc-c++ make cmake tar zlib wget subversion git

# Install gcc prereqs
RUN yum install -y bzip2 libmpc-devel mpfr-devel gmp-devel flex

# Get and build gcc 4.9.3
RUN mkdir /gcc493 && cd /gcc493 && mkdir gcc493_build && \
    svn co svn://gcc.gnu.org/svn/gcc/tags/gcc_4_9_3_release && \
    cd gcc493_build && \
    ../gcc_4_9_3_release/configure --disable-multilib \
                                   --enable-languages=c,c++,fortran \
                                   --enable-threads=posix && \
    make -j4 && make install && \
    rm -rf /gcc493

# LD library configuration
RUN echo /usr/local/lib64 > /etc/ld.so.conf.d/local.conf && \
    echo /usr/local/lib >> /etc/ld.so.conf.d/local.conf && \
    ldconfig && ldconfig -p
