# https://hub.docker.com/_/ubuntu
FROM ubuntu:22.04

LABEL maintainer="" 

RUN apt update -y && apt upgrade -y \
    && apt install -y unzip \
    && apt install -y gzip \
    && apt install -y tar \
    && apt install -y wget \
    && apt install -y curl \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN echo "curl version: $(curl --version | head -n 1)" \
    && echo "wget version: $(wget --version | head -n 1)" \
    && echo "unzip version: $(unzip -v | head -n 1)" \
    && echo "tar version: $(tar --version | head -n 1)" \ 
    && echo "gzip version: $(gzip --version | head -n 1)"

# USER 1001

CMD ["echo", "This is a 'Purpose Built Image', It is not meant to be ran directly"]
