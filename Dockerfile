FROM ruby:2.6.0-alpine

WORKDIR /app
COPY Gemfile /app
COPY Gemfile.lock /app
COPY . /app

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        gcc \
        g++ \
        libc-dev \
        libxml2-dev \
        linux-headers \
        make \
        nodejs \
        mysql \
        mysql-dev \
        mysql-client \
        tzdata \
        yarn && \
    apk add --virtual build-packs --no-cache \
        build-base \
        curl-dev && \
    gem install bundler && \
    bundle install && \
    apk del build-packs
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
