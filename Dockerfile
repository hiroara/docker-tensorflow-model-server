FROM ubuntu:16.04

Maintainer Hiroki Arai <hiroara62@gmail.com>

ARG TF_VERSION=1.6.0

RUN apt-get update && apt-get install -y curl software-properties-common

RUN add-apt-repository ppa:ubuntu-toolchain-r/test -y

RUN echo "deb [arch=amd64] http://storage.googleapis.com/tensorflow-serving-apt stable tensorflow-model-server tensorflow-model-server-universal" | \
    tee /etc/apt/sources.list.d/tensorflow-serving.list

RUN curl https://storage.googleapis.com/tensorflow-serving-apt/tensorflow-serving.release.pub.gpg | apt-key add -
RUN apt-get update && apt-get install -y libstdc++6 tensorflow-model-server=${TF_VERSION}
