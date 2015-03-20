#!/bin/bash

##########
# Installation of the XXXXXX
#
# pull images, build images, run all containers
##########

# reset all running containers if they still are running
docker-wash

# pull out the global boxes
docker pull centos:7
docker pull php:5.6


# Building local images
# Build an image (from busybox with configuration)
docker build -t name/data-storage .


## Create running containers

# Data Storage Container
docker run --name data-storage -d name/data-storage

# Apache Container
docker run --name centos-apache -d --volumes-from tdata-storage name/apache-centos

# PHP Container
docker run --name centos-php -d --volumes-from data-storage name/php-centos


#check if git repository is already there


