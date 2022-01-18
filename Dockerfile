FROM ubuntu

# general environment for docker
ENV DEBIAN_FRONTEND=noninteractive \
    SPACK_ROOT=/usr/local \
    FORCE_UNSAFE_CONFIGURE=1 \
    PATH=/usr/local/bin:${PATH}

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        curl \
        cpio \
        gnupg \
        gcc \
       g++ \
        gfortran \
        python \
        mpich \
        libmpich-dev \
       mlocate \
       wget \
    && rm -rf /var/lib/apt/lists/*


# install mkl

RUN cd /tmp && \
wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB && \
 apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB && \
 sh -c 'echo deb https://apt.repos.intel.com/mkl all main > /etc/apt/sources.list.d/intel-mkl.list' && \
 apt-get update && \
 apt-get install -y intel-mkl-64bit-2018.2-046 

RUN echo "/opt/intel/lib/intel64"     >  /etc/ld.so.conf.d/mkl.conf && \
    echo "/opt/intel/mkl/lib/intel64" >> /etc/ld.so.conf.d/mkl.conf && \
    ldconfig && \
    echo "source /opt/intel/mkl/bin/mklvars.sh intel64" >> /etc/bash.bashrc && \
    echo "source /opt/intel/mkl/bin/mklvars.sh" >> /etc/profile  && \
    echo "MKL_THREADING_LAYER=GNU" >> /etc/environment

#RUN cd /tmp && \
#    wget https://gitlab.com/QEF/q-e/-/archive/qe-6.3/q-e-qe-6.3.tar.gz && \
#    tar zxf q-e-qe-6.3.tar.gz

ENV MKLVARS_ARCHITECTURE=intel64
ENV LD_LIBRARY_PATH=/opt/intel/mkl/lib/intel64


CMD /bin/bash -l


