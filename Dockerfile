# Get base image
FROM ubuntu:18.04

MAINTAINER Maya Mallaby-Kay <mayamkay@umich.edu>

# Install base packages
RUN apt-get update && apt-get install -y \
        automake                         \
        build-essential                  \
        cmake                            \
        emacs                            \
	gcc                 \
        gfortran                         \
        git                              \
        libtool                         \
        libcfitsio-dev                   \
        libfftw3-dev                     \
        libgsl-dev                       \
        libchealpix-dev                  \
        libopenmpi-dev                   \
        python3                          \
        python3-pip                      \
        vim                              \
        wget

# Create a user called actdr4
RUN useradd -m -U actdr4

# Make a new workspace
RUN mkdir home/workspace
WORKDIR /usr/home/workspace

# Install python packages
RUN pip3 install astropy astropy-helpers cython healpy ipython jupyter numpy pip mpi4py numba toml image getdist camb

RUN pip3 install pymaster

# Install Pixell using the gcc compiler 
RUN git clone https://github.com/simonsobs/pixell.git 
WORKDIR /usr/home/workspace/pixell
RUN CC=gcc python3 setup.py build_ext -i
RUN CC=gcc python3 setup.py install

# Install Nawrapper
WORKDIR /usr/home/workspace
RUN git clone https://github.com/xzackli/nawrapper
WORKDIR /usr/home/workspace/nawrapper
RUN python3 setup.py build_ext -i
RUN python3 setup.py install 

# Install pyactlike which is used for the likelihood
# RUN git clone https://github.com/ACTCollaboration/pyactlike.git
# WORKDIR /usr/home/workspace/pyactlike
# RUN pip3 install 

# Return to the workspace directory, make actdr4 the owner of the directory and switch from root to actdr4 user
WORKDIR /usr/home/workspace
RUN chown actdr4 /usr/home/workspace
USER actdr4

# Add data files and notebooks to the container we will later link a local directory to the 'data' directory in the container
ADD /Notebooks Notebooks
ADD /Data data

# Expose a port to run the notebook on later
EXPOSE 8888
