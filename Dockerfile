FROM karathan/dapper:6.06
USER root
RUN apt-get update && apt-get install -y wget gcc make