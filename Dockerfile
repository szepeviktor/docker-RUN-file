FROM debian:12.0-slim

ARG LC_ALL=C
ARG TERM=linux
ARG DEBIAN_FRONTEND=noninteractive

RUN --mount=type=bind,source=docker-scripts,target=/opt/docker-scripts /opt/docker-scripts/a.sh

RUN find /opt
