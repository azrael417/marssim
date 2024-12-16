FROM nvcr.io/nvidia/cuda:12.3.1-devel-ubuntu22.04

# Install System Dependencies
ENV DEBIAN_FRONTEND noninteractive
RUN apt update -y && \
    apt install -y curl unzip wget cmake && \
    apt install -y python3 python-is-python3 python3-pip python3-pybind11 && \
    apt install -y git vim gfortran doxygen && \
    apt install -y libibverbs-dev ibverbs-utils numactl

# Install NVHPC SDK
RUN wget https://developer.download.nvidia.com/hpc-sdk/24.1/nvhpc_2024_241_Linux_x86_64_cuda_12.3.tar.gz && \
    tar xpzf nvhpc_2024_241_Linux_x86_64_cuda_12.3.tar.gz && \
    nvhpc_2024_241_Linux_x86_64_cuda_12.3/install --quiet && \
    rm -rf nvhpc_2024_241_Linux_x86_64_cuda_12.3 nvhpc_2024_241_Linux_x86_64_cuda_12.3.tar.gz

ENV PATH /opt/nvidia/hpc_sdk/Linux_x86_64/24.1/compilers/bin:$PATH
ENV PATH /opt/nvidia/hpc_sdk/Linux_x86_64/24.1/comm_libs/mpi/bin:$PATH
ENV LD_LIBRARY_PATH /opt/nvidia/hpc_sdk/Linux_x86_64/24.1/cuda/lib64:$LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH /opt/nvidia/hpc_sdk/Linux_x86_64/24.1/comm_libs/mpi/lib:$LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH /opt/nvidia/hpc_sdk/Linux_x86_64/24.1/comm_libs/nvshmem/lib:$LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH /opt/nvidia/hpc_sdk/Linux_x86_64/24.1/math_libs/lib64:$LD_LIBRARY_PATH
ENV CUDA_HOME /opt/nvidia/hpc_sdk/Linux_x86_64/24.1/cuda

RUN echo "source /opt/nvidia/hpc_sdk/Linux_x86_64/24.1/comm_libs/12.3/hpcx/latest/hpcx-init.sh; hpcx_load" >>  /root/.bashrc

# install marssim
COPY CMakeLists.txt /opt/marssim/CMakeLists.txt
COPY src /opt/marssim/src
RUN cd /opt/marssim && mkdir build && cd build && \
    cmake -DCMAKE_PREFIX_PATH=/opt/marssim/install \
          -DCMAKE_Fortran_COMPILER=nvfortran \
    	  -DCMAKE_C_COMPILER=nvcc \
	  -DCMAKE_CXX_COMPILER=nvc++ \
	  .. && \
    make
   
	