# Building apt-mirror from sources

FROM debian:buster-slim

RUN apt update && apt install wget --no-install-recommends -y
