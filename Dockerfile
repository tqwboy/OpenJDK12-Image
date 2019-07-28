FROM debian:stretch-slim
MAINTAINER tqw "jack_coder@outlook.com"

ENV LANG C.UTF-8

# set environment
ENV FUNCTION_MODE="all" \
    TIME_ZONE="Asia/Shanghai"\
    JAVA_HOME="/usr/lib/jvm/java-12-openjdk-amd64"

RUN apt-get update && apt-get -y upgrade \
    && echo 'deb http://ftp.de.debian.org/debian sid main ' >> '/etc/apt/sources.list' \
    && apt-get -y update \
    && mkdir -p /usr/share/man/man1 \
    && apt-get -y install openjdk-12-jre-headless \
    && apt-get -y install wget \
    && apt-get autoremove -y wget \
    && ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo '$TIME_ZONE' > /etc/timezone \
    && apt-get -y clean \
    && rm -rf /tmp/* /var/tmp/* /var/cache/apt /var/lib/apt/lists/*

