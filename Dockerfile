FROM python:2.7

ENV REDRM_VERSION 6.6.1

RUN apt-get update && apt-get install -y unzip \
  && rm -rf /var/lib/apt/lists/*

RUN set -eux \
  \
  && wget https://github.com/apprenticeharper/DeDRM_tools/releases/download/v$REDRM_VERSION/DeDRM_tools_$REDRM_VERSION.zip
