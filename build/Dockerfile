##
## @file        Dockerfile
## @brief       Dockerfile to Build the GUINNESS Docker Image (for CPU only)
## @author      Keitetsu
## @date        2018/08/02
## @copyright   Copyright (c) 2018 Keitetsu
## @par         License
##              This software is released under the MIT License.
##

FROM ubuntu:18.04

LABEL maintainer="KeitetsuWorks@users.noreply.github.com"

# install applications
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y locales && \
    apt-get install -y vim && \
    apt-get install -y git && \
    apt-get install -y python3-pip && \
    apt-get install -y python3-pyqt4 && \
    apt-get clean && \
    apt-get autoclean && \
    \
    pip3 install --no-cache-dir --upgrade pip==9.0.3 && \
    pip3 install --no-cache-dir numpy && \
    pip3 install --no-cache-dir Pillow && \
    pip3 install --no-cache-dir scipy && \
    pip3 install --no-cache-dir matplotlib && \
    pip3 install --no-cache-dir chainer==1.24.0 && \
    pip3 install --no-cache-dir opencv-python && \
    \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* && \
    rm -rf /var/cache/* && \
    rm -rf /var/lib/apt/lists/*

# set the system python to python 3
RUN ln -sf /usr/bin/python3.6 /usr/bin/python && \
    ln -sf /usr/bin/pydoc3.6 /usr/bin/pydoc

# vim settings (optional)
RUN cd ~ && \
    git clone https://github.com/tomasr/molokai.git && \
    mkdir -p ~/.vim/colors && \
    mv ./molokai/colors/molokai.vim ~/.vim/colors && \
    rm -rf ./molokai && \
    git clone https://github.com/KeitetsuWorks/VimSettings.git && \
    mv ./VimSettings/.vimrc ~ && \
    rm -rf ./VimSettings && \
    sed -i -e "/^colorscheme.*/i set t_Co=256" .vimrc && \
    cp -r ~/.vim /etc/skel && \
    cp ~/.vimrc /etc/skel

# locale settings
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

