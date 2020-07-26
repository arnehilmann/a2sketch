FROM node:10.22.0-alpine3.11 AS node_base




FROM node_base AS build
LABEL maintainer="arne@hilmann.de"

RUN apk add curl git php php-json

RUN npm install -g underscore xpath xmldom express body-parser svgo sync-files roughjs
RUN npm install @svgdotjs/svg.js svgdom

WORKDIR /
RUN git clone https://github.com/dhobsd/asciitosvg.git
RUN curl -OL https://github.com/ipython/xkcd-font/raw/master/xkcd-script/font/xkcd-script.ttf

ENV NODE_PATH=/usr/local/lib/node_modules

COPY addons/* /asciitosvg/objects/
# RUN chmod a+rwx /asciitosvg/objects/
RUN chown -R node:node /asciitosvg/objects/

# switch to non-root user
USER node
WORKDIR /home/node/

RUN mkdir -p .a2s/
RUN ln -sf /asciitosvg/objects .a2s/objects

COPY a2sketch.webserver .

VOLUME /custom-types

ENTRYPOINT ["node", "a2sketch.webserver"]
