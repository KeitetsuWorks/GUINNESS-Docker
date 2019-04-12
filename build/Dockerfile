##
## @file        Dockerfile
## @brief       Dockerfile to Build the GUINNESS Docker Image (for CUDA 8.0)
## @author      Keitetsu
## @date        2019/01/13
## @copyright   Copyright (c) 2019 Keitetsu
## @par         License
##              This software is released under the MIT License.
##

FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04

LABEL maintainer="KeitetsuWorks@users.noreply.github.com"

# install applications
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y locales && \
    apt-get install -y vim && \
    apt-get install -y wget && \
    apt-get install -y curl && \
    apt-get install -y git && \
    apt-get clean && \
    apt-get autoclean && \
    \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* && \
    rm -rf /var/cache/* && \
    rm -rf /var/lib/apt/lists/*

# install dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y make && \
    apt-get install -y build-essential && \
    apt-get install -y llvm && \
    apt-get install -y libssl-dev && \
    apt-get install -y zlib1g-dev && \
    apt-get install -y libbz2-dev && \
    apt-get install -y libreadline-dev && \
    apt-get install -y libsqlite3-dev && \
    apt-get install -y libncurses5-dev && \
    apt-get install -y libncursesw5-dev && \
    apt-get install -y libpng-dev && \
    apt-get install -y libsm6 && \
    apt-get install -y libxrender1 && \
    apt-get install -y libgtk2.0-0 && \
    apt-get install -y fonts-noto-cjk && \
    apt-get clean && \
    apt-get autoclean && \
    \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* && \
    rm -rf /var/cache/* && \
    rm -rf /var/lib/apt/lists/*

# locale settings
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

# timezone settings (optional)
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y tzdata && \
    ln -fns /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    echo 'Asia/Tokyo' > /etc/timezone && \
    \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* && \
    rm -rf /var/cache/* && \
    rm -rf /var/lib/apt/lists/*

# vim settings (optional)
RUN cd ~ && \
    git clone --depth 1 https://github.com/tomasr/molokai.git && \
    mkdir -p ~/.vim/colors && \
    mv ./molokai/colors/molokai.vim ~/.vim/colors && \
    rm -rf ./molokai && \
    git clone --depth 1 https://github.com/KeitetsuWorks/VimSettings.git && \
    mv ./VimSettings/.vimrc ~ && \
    rm -rf ./VimSettings && \
    sed -i -e "/^colorscheme.*/i set t_Co=256" .vimrc && \
    cp -r ~/.vim /etc/skel && \
    cp ~/.vimrc /etc/skel

# add user
RUN groupadd \
        --gid 1000 \
        guinness && \
    useradd \
        --gid 1000 \
        --create-home \
        --uid 1000 \
        guinness
RUN mkdir -p /opt/GUINNESS && \
    chown -R guinness:guinness /opt/GUINNESS

# change user
USER guinness
WORKDIR /opt/GUINNESS

# install Python 3.5.1
RUN export CUDA_PATH=/usr/local/cuda-8.0 && \
    export PATH=$CUDA_PATH/bin:$PATH && \
    export CPATH=$CUDA_PATH/include:$CPATH && \
    export LD_LIBRARY_PATH=$CUDA_PATH/lib64:$LD_LIBRARY_PATH && \
    git clone --depth 1 https://github.com/yyuu/pyenv.git /home/guinness/.pyenv && \
    git clone --depth 1 https://github.com/yyuu/pyenv-pip-rehash.git /home/guinness/.pyenv/plugins/pyenv-pip-rehash && \
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> /home/guinness/.bashrc && \
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> /home/guinness/.bashrc && \
    echo 'eval "$(pyenv init -)"' >> /home/guinness/.bashrc && \
    /home/guinness/.pyenv/bin/pyenv install anaconda3-4.1.0 && \
    /home/guinness/.pyenv/bin/pyenv global anaconda3-4.1.0 && \
    /home/guinness/.pyenv/versions/anaconda3-4.1.0/bin/conda update -y conda && \
    /home/guinness/.pyenv/versions/anaconda3-4.1.0/bin/conda install -y -c menpo opencv3 && \
    /home/guinness/.pyenv/versions/anaconda3-4.1.0/bin/pip install --no-cache-dir --upgrade pip==9.0.3 && \
    /home/guinness/.pyenv/versions/anaconda3-4.1.0/bin/pip install --no-cache-dir chainer==1.24.0 -vvvv
