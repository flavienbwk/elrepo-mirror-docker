# Building apt-mirror from sources

FROM debian:buster-slim

RUN apt update && apt install perl wget --no-install-recommends -y
