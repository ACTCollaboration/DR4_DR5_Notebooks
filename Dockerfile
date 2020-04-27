# Get base image
FROM ubuntu:18.04

MAINTAINER Maya Mallaby-Kay <mayamkay@umich.edu>


RUN apt-get update && apt-get install -y \
        automake                         \
        build-essential                  \
        emacs                            \
        gfortran                         \
        git                              \
        libcfitsio-dev                   \
        libfftw3-dev                     \
        libgsl-dev                       \
        libchealpix-dev                  \
        libopenmpi-dev                   \
        python3                          \
        python3-pip                      \
        vim                              \
        wget




WORKDIR /Users/mayamallaby-kay/Desktop/DockerFiles

ENTRYPOINT ["./run_docker.sh"]


CMD ["echo", "Hello World...! From my first docker image"]
