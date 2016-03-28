FROM cern/cc7-base
MAINTAINER Steve Farrell <Steven.Farrell@cern.ch>
RUN yum update -y && \
    yum install -y gcc gcc-c++ make cmake tar zlib wget subversion git
