############################################################
# Dockerfile to build MongoDB container images
# Based on Ubuntu 14.04 LTS
# GNU LESSER GENERAL PUBLIC LICENSE Version 3
# Use without limitations, even for commercial purposes.
############################################################

# Set the base image to Ubuntu
FROM ubuntu:14.04

# File Maintainer
MAINTAINER Andris Veldrajs

################## BEGIN INSTALLATION ######################

# Install MongoDB Following the Instructions at MongoDB Docs
# Ref: http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/

# To avoid error messages:
#   debconf: unable to initialize frontend: Dialog
#   debconf: (TERM is not set, so the dialog frontend is not usable.)
#   debconf: falling back to frontend: Readline
#   debconf: unable to initialize frontend: Readline
#   debconf: (This frontend requires a controlling tty.)
#   debconf: falling back to frontend: Teletype
#   dpkg-preconfigure: unable to re-open stdin:
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Add the package verification key
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

# Add MongoDB to the repository sources list
RUN echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list

# Update the repository sources list once more
RUN apt-get update

# Install MongoDB newest package
RUN apt-get install -y mongodb-org
# Install specific MongoDB verion
# apt-get install -y mongodb-org=3.0.1 mongodb-org-server=3.0.1 mongodb-org-shell=3.0.1 mongodb-org-mongos=3.0.1 mongodb-org-tools=3.0.1

#####################  CONFIGURATION  #####################

# Define working directory.
WORKDIR /data

# Create the directories - /data will be mounted to host
RUN mkdir -p /data/db
RUN mkdir -p /data/logs

# Define environment variables for startup script
ENV DATA_PATH /data/db
ENV CONFIG_FILE /usr/local/etc/mongod.conf
ENV LOGS_PATH /data/logs/mongod.log
ENV MAIN_PORT 27017
# LogAppend will write all logs to one file specified in LOGS_PATH.
# If LogAppend is disabled then on each start new log is started.
#   Old log are renamed with addition of timestamp.
ENV ENABLE_LOGAPPEND False
# If You need to enable http interface then change to True.
ENV ENABLE_HTTP_INTERFACE False
# If You want to disable authentication then change to False.
ENV ENABLE_AUTH True

# Specify binding IP address. Default value: 0.0.0.0
# ENV BIND_IP 0.0.0.0

# Set StorageEngine - default = MMAPv1
# WiredTiger (from MongoDB v3) - more granular concurrency control and native
#   compression will provide significant benefits in the areas of lower
#   storage costs, greater hardware utilization, and more predictable performance.
#   Compression reduces storage footprint by as much as 80%, and enables higher
#   storage I/O scalability as fewer bits are read from disk.
# Options: mmapv1 or wiredTiger. Default value: mmapv1
ENV STORAGE_ENGINE wiredTiger
# Options: none, snappy or zlib
# Ignored if mmapv1 is used
ENV WIREDTIGER_JOURNAL_COMPRESSOR snappy
# Options: none, snappy or zlib
# Ignored if mmapv1 is used
ENV WIREDTIGER_COLLECTION_BLOCK_COMPRESSOR snappy

##################### COPY FILES ###########################
ADD mongodb-startup.sh /usr/local/sbin/mongodb-startup.sh
ADD mongod.conf /usr/local/etc/mongod.conf
RUN chmod 755 /usr/local/sbin/mongodb-startup.sh

##################### INSTALLATION END #####################

# Expose the default port to host
EXPOSE 27017 28017

# Default port to execute the entrypoint (MongoDB)
# CMD ["--port 27017"]
CMD /usr/local/sbin/mongodb-startup.sh
