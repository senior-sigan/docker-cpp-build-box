FROM ubuntu:20.04

LABEL maintainer="Ilya Siganov <ilya.blan4@gmail.com>"
LABEL org.opencontainers.image.source https://github.com/senior-sigan/docker-cpp-build-box

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    clang \
    clang-format \
    clang-tidy \
    valgrind && \
    apt-get autoclean -qy && \
    apt-get autoremove

WORKDIR /code

CMD ["--help"]