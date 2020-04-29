# Get base image


FROM ubuntu:18.04
MAINTAINER Maya Mallaby-Kay <mayamkay@umich.edu>



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

RUN useradd -m -U AdvACT
RUN mkdir home/workspace
WORKDIR /usr/home/workspace

RUN pip3 install astropy astropy-helpers cython healpy ipython jupyter numpy pip mpi4py numba toml image

# Install Pixell
RUN git clone https://github.com/simonsobs/pixell.git 
WORKDIR /usr/home/workspace/pixell

RUN CC=gcc python3 setup.py build_ext -i
RUN CC=gcc python3 setup.py install

WORKDIR /usr/home/workspace

RUN chown AdvACT /usr/home/workspace
USER AdvACT

# Add data files and notebook
ADD /Advanced_ACT_DR4_Combined_data_products.ipynb Advanced_ACT_DR4_Combined_data_products.ipynb

ADD /Data data

EXPOSE 8888

#CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0"s, "--allow-root"]



