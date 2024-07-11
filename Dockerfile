FROM debian:unstable

RUN echo "deb http://deb.debian.org/debian unstable main" > /etc/apt/sources.list
RUN rm -f /etc/apt/sources.list.d/debian.sources

RUN apt update

RUN apt install -y curl git debhelper pkg-config wget
RUN apt install -y desktop-file-utils gettext meson libglib2.0-dev libadwaita-1-dev appstream blueprint-compiler

CMD ["/shared/build-in-docker.sh"]
