FROM ubuntu:bionic
USER root
RUN apt-get update && apt-get install -y wget gcc make libc6-dev build-essential autoconf
RUN mkdir /arm-elf
RUN mkdir -p arm-elf-src/src
COPY arm-elf-src/src /arm-elf-src/src
COPY build.sh /build.sh
ENTRYPOINT ["/build.sh"]