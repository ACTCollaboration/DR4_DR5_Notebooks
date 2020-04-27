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



RUN ln -sfn /usr/bin/python3 /usr/bin/python

WORKDIR /home/DockerFiles


RUN python3 -m pip install --user --upgrade pip numpy cython ipython jupyter
RUN python3 -m pip install --user --upgrade astropy astropy-helpers healpy mpi4py numba toml
RUN python3 -m pip install --user --upgrade pysm3
RUN python3 -m pip install --user git+https://github.com/simonsobs/PSpipe.git

