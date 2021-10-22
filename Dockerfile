FROM nvidia/cuda:11.2.0-cudnn8-devel-ubuntu18.04
LABEL maintainer="siwazaki@nefrock.com"

ENV LC_ALL "C.UTF-8"
ENV LANG "C.UTF-8"
# For tzdata dependent libs
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y --no-install-recommends \
  build-essential \
  cmake \
  git \
  zip \
  unzip \
  wget \
  openssl \
  file \
  curl \
  zlib1g-dev \
  libsm-dev \
  libglib2.0-dev \
  libxrender-dev \
  libxext-dev \
  ca-certificates \
  python3-dev \
  python3-pip \
  python3-setuptools \
  libssl-dev \
  libsndfile1-dev \
  emacs \
  sox \
  jq \
  ssh \
  zsh \
  imagemagick \
  libopenblas-base \
  libopenblas-dev \
  swig

RUN rm -rf /var/lib/apt/lists/*

WORKDIR /opt/initialization
RUN pip3 install --upgrade pip
RUN pip3 install torch==1.10.0+cu113 torchvision==0.11.1+cu113 torchaudio==0.10.0+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html
# ADD requirements.txt requirements.txt
# RUN pip3 install -r requirements.txt

# install parallel wavegan
WORKDIR /workspace
RUN git clone https://github.com/kan-bayashi/ParallelWaveGAN.git /workspace/ParallelWaveGAN
WORKDIR /workspace/ParallelWaveGAN
RUN pip3 install -e .

WORKDIR /workspace
