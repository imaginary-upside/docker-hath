FROM alpine:3.11

ENV ZIP_URL=https://repo.e-hentai.org/hath/HentaiAtHome_1.6.0.zip
ENV ZIP_SHA=597f0ae2d114a86e021013b0146d59b1f2f8be2025bfae6b38c181515b795018

RUN mkdir /opt/hath
WORKDIR /opt/hath

ADD ./bootstrap.sh ./bootstrap.sh
RUN chmod u+x ./bootstrap.sh

RUN apk --no-cache add curl unzip openjdk8-jre

RUN addgroup -S -g 1050 hath && \
  adduser -SH -G hath -u 1050 hath && \
  chown hath:hath -R ./ && \
  chmod 750 -R ./
USER hath

RUN curl $ZIP_URL --output HentaiAtHome.zip && \
  echo "$ZIP_SHA  HentaiAtHome.zip" | sha256sum -c && \
  unzip HentaiAtHome.zip && \
  rm HentaiAtHome.zip

VOLUME /opt/hath/cache

ENTRYPOINT ["/opt/hath/bootstrap.sh"]
