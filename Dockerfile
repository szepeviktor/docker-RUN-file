FROM 12.0-slim

RUN --mount=type=bind,source=docker-scripts,target=/opt/docker-scripts

RUN /opt/docker-scripts/a.sh
