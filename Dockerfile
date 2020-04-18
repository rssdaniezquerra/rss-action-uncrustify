FROM debian:latest

COPY entrypoint.sh /entrypoint.sh
COPY default.cfg /default.cfg

RUN apt-get update
RUN apt-get -y install curl cmake build-essential python3 git
RUN chmod +x entrypoint.sh
RUN curl -L -o uncrustify-0.70.1.tar.gz https://github.com/uncrustify/uncrustify/archive/uncrustify-0.70.1.tar.gz
RUN tar -xzf uncrustify-0.70.1.tar.gz
WORKDIR /uncrustify-uncrustify-0.70.1
RUN mkdir build
WORKDIR /uncrustify-uncrustify-0.70.1/build
RUN cmake ..
RUN cmake --build .
RUN cp uncrustify /usr/local/bin && chmod +x /usr/local/bin/uncrustify

ENTRYPOINT ["/entrypoint.sh"]
