FROM ubuntu:bionic
USER root
RUN apt-get update && apt-get install -y wget gcc make libc6-dev build-essential autoconf
RUN mkdir /arm-elf
COPY arm-elf-src /arm-elf-src
COPY build.sh /build.sh
ENTRYPOINT ["/build.sh"]