FROM registry.access.redhat.com/ubi9/ubi-minimal:9.0.0
# FROM redhat/ubi9/ubi-minimal:9.0.0

LABEL maintainer="" 

# MicroDNF is recommended over YUM for Building Container Images
# https://www.redhat.com/en/blog/introducing-red-hat-enterprise-linux-atomic-base-image

RUN microdnf update -y \
    && microdnf install -y unzip \
    && microdnf install -y gzip \
    && microdnf install -y tar \
    && microdnf install -y wget \
    && microdnf clean all \
    && rm -rf /var/cache/* /var/log/dnf* /var/log/yum.*

RUN echo "curl version: $(curl --version | head -n 1)" \
    && echo "wget version: $(wget --version | head -n 1)" \
    && echo "unzip version: $(unzip -v | head -n 1)" \
    && echo "tar version: $(tar --version | head -n 1)" \ 
    && echo "gzip version: $(gzip --version | head -n 1)"

USER 1001

CMD ["echo", "This is a 'Purpose Built Image', It is not meant to be ran directly"]
