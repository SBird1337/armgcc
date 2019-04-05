FROM karathan/dapper:6.06
USER root
RUN apt-get update && apt-get install -y wget gcc make
RUN mkdir /arm-elf
COPY arm-elf-src /arm-elf-src
COPY build.sh /build.sh
ENTRYPOINT ["/build.sh"]