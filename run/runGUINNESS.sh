#!/bin/bash

##
## @file        runSDSoC.sh
## @brief       Script to run the GUINNESS Docker Image (for CPU only)
## @author      Keitetsu
## @date        2018/08/02
## @copyright   Copyright (c) 2018 Keitetsu
## @par         License
##              This software is released under the MIT License.
##

xhost +local:root

docker run \
    --interactive \
    --tty \
    --net host \
    --rm \
    --name guinness \
    --env DISPLAY=${DISPLAY} \
    --env QT_X11_NO_MITSHM=1 \
    --volume /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --volume ${HOME}/GUINNESS:/opt/GUINNESS \
    --volume ${HOME}:/data \
    keitetsu/guinness-base \
    /bin/bash

