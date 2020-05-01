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

# Create a user called AdvACT
RUN useradd -m -U AdvACT

# Make a new workspace
RUN mkdir home/workspace
WORKDIR /usr/home/workspace

# Install python packages
RUN pip3 install astropy astropy-helpers cython healpy ipython jupyter numpy pip mpi4py numba toml image

# Install Pixell using the gcc compiler 
RUN git clone https://github.com/simonsobs/pixell.git 
WORKDIR /usr/home/workspace/pixell
RUN CC=gcc python3 setup.py build_ext -i
RUN CC=gcc python3 setup.py install

# Return to the workspace directory, make AdvACT the owner of the directory and switch from root to AdvACT user
WORKDIR /usr/home/workspace
RUN chown AdvACT /usr/home/workspace
USER AdvACT

# Add data files and notebooks to the container we will later link a local directory to the 'data' directory in the container
ADD /Advanced_ACT_DR4_Combined_data_products.ipynb Advanced_ACT_DR4_Combined_data_products.ipynb
ADD /Advanced_ACT_DR4_Map_Splits_with_Power_Spectrum_analysis.ipynb Advanced_ACT_DR4_Map_Splits_with_Power_Spectrum_analysis.ipynb
ADD /Data data

# Expose a port to run the notebook on later
EXPOSE 8888
