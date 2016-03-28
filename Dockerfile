FROM cern/cc7-base
MAINTAINER Steve Farrell <Steven.Farrell@cern.ch>

# Basic update and development tools
RUN yum update -y && \
    yum install -y gcc gcc-c++ make cmake tar zlib wget subversion git
