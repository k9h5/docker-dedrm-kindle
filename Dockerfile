FROM python:2.7

ENV REDRM_VERSION 6.6.1

RUN apt-get update && apt-get install -y unzip \
  && rm -rf /var/lib/apt/lists/*

RUN pip install pycrypto pylzma

RUN set -eux \
  && cd /usr/local/src \
  && wget https://github.com/apprenticeharper/DeDRM_tools/releases/download/v$REDRM_VERSION/DeDRM_tools_$REDRM_VERSION.zip \
  && cd $HOME \
  && mkdir redrm \
  && cd redrm \
  && unzip /usr/local/src/DeDRM_tools_$REDRM_VERSION.zip \
  && mkdir /root/out

COPY decryptk4mobi.py /root/redrm/DeDRM_Windows_Application/DeDRM_App/DeDRM_lib/lib/

ENTRYPOINT ["/root/redrm/DeDRM_Windows_Application/DeDRM_App/DeDRM_lib/lib/decryptk4mobi.py", "/root/out"]
CMD []
