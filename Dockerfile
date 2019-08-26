FROM alpine:3.10

ENV ZIP_URL=https://repo.e-hentai.org/hath/HentaiAtHome_1.4.2.zip
ENV ZIP_SHA=da25fdec0a9535b265677a230e5cf84c75f0cfe790cffc51a520cf7cf3b01b2f

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

VOLUME /opt/hath/data
VOLUME /opt/hath/cache

ENTRYPOINT ["/opt/hath/bootstrap.sh"]
