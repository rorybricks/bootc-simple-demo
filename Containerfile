FROM quay.io/fedora/fedora-bootc:42

LABEL org.opencontainers.image.source="https://github.com/brightrory/bootc-simple-demo"
LABEL org.opencontainers.image.description="Bootc Simple Demo for Bright Cubes Lunch & Learn"
LABEL org.opencontainers.image.license="MIT"

#include unit files and containers
ADD etc etc

RUN ln -s /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime

RUN dnf install -y cowsay lolcat

# Insert RPM packages here

RUN bootc container lint
