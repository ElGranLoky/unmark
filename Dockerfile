FROM ruby:alpine as build

#Download unmark and setup base
RUN apk update \
&& apk --no-cache add git python3 build-base ruby-dev \
&& mkdir /src \
&& cd /src/ \
&& git clone https://github.com/cdevroe/unmark.git

#Install dependencies
RUN apk add npm \
&& npm install -g grunt grunt-cli --save-dev \
&& npm install -g grunt-contrib-sass --save-dev \
&& gem install sass

#Build
WORKDIR /src/unmark
RUN npm install \
&& grunt

FROM webdevops/php-nginx:7.4-alpine as app

ARG BUILD_DATE
ARG VCS_REF

LABEL maintainer="https://github.com/ElGranLoky" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/ElGranLoky/unmark.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0.0-rc1"

COPY --from=build /src/unmark/ /app/

COPY database.php /app/application/config/database.php