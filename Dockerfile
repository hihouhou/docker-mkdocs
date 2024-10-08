#
# Mkdocs Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

LABEL org.opencontainers.image.authors="hihouhou < hihouhou@hihouhou.com >"

ENV MKDOCS_VERSION=1.6.1

# Update & install packages for go-callisto dep
RUN apt-get update && \
    apt-get install -y python-pip python

# Get go-callisto from github
RUN pip install "mkdocs==${MKDOCS_VERSION}"

# Configure
RUN mkdir /opt/mkdocs && cd /opt/mkdocs && mkdocs new project
WORKDIR /opt/mkdocs/project

EXPOSE 8000

CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]
