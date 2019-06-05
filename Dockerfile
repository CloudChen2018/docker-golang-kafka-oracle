FROM golang:1.12.4

ENV TZ=Asia/Taipei

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./data/* /data/

RUN \
  apt-get update && apt-get install -y \
  apt-utils \
  nano \
  unzip \
  libaio1 \
  libaio-dev

RUN \
  unzip "/data/instantclient-basic-linux.x64-18.5.0.0.0dbru.zip" -d "/data/" && \
  unzip "/data/instantclient-sdk-linux.x64-18.5.0.0.0dbru.zip" -d "/data/" && \
  unzip "/data/instantclient-sqlplus-linux.x64-18.5.0.0.0dbru.zip" -d "/data/" && \
  mv "/data/instantclient_18_5/" "/usr/lib/" && \
  mv "/data/oci8.pc" "/usr/lib/pkgconfig/" && \
  echo "/usr/lib/instantclient_18_5" >> "/etc/ld.so.conf" && \
  ldconfig

RUN \
  git clone "https://github.com/edenhill/librdkafka.git" && \
  cd librdkafka && \
  ./configure --prefix /usr && \
  make && \
  make install && \
  rm -rf "/data"

CMD tail -f /dev/null