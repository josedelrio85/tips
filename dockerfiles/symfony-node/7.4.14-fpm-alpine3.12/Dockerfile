FROM php:7.4.14-fpm-alpine3.12

# Install dependencies
RUN	apk update \
 && apk upgrade \
 && apk add --update \
      nginx \
      supervisor \
      curl \
      git \
      grep \
      build-base \
      libmemcached-dev \
      libmcrypt-dev \
      libxml2-dev \
      imagemagick-dev \
      pcre-dev \
      libtool \
      make \
      autoconf \
      g++ \
      cyrus-sasl-dev \
      libgsasl-dev \
      freetype-dev \
      libjpeg-turbo-dev \
      libpng-dev \
      icu-dev \
      g++ \
 && rm -rf /var/cache/apk/*

# Install nodejs
ENV NODE_VERSION 10.19.0
RUN apk add --update nodejs nodejs-npm

RUN node --version && npm --version

ENV YARN_VERSION 1.9.4

RUN apk add --no-cache --virtual .build-deps-yarn curl gnupg tar \
  && for key in \
    6A010C5166006599AA17F08146C2130DFD2497F5 \
  ; do \
    gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" || \
    gpg --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys "$key" || \
    gpg --keyserver hkp://pgp.mit.edu:80 --recv-keys "$key" ; \
  done \
  && curl -fsSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" \
  && curl -fsSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz.asc" \
  && gpg --batch --verify yarn-v$YARN_VERSION.tar.gz.asc yarn-v$YARN_VERSION.tar.gz \
  && mkdir -p /opt \
  && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/ \
  && ln -s /opt/yarn-v$YARN_VERSION/bin/yarn /usr/local/bin/yarn \
  && ln -s /opt/yarn-v$YARN_VERSION/bin/yarnpkg /usr/local/bin/yarnpkg \
  && rm yarn-v$YARN_VERSION.tar.gz.asc yarn-v$YARN_VERSION.tar.gz \
  && apk del .build-deps-yarn

