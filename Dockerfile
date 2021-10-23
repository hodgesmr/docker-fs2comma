FROM alpine:3.14.2
WORKDIR /opt/fs2comma

RUN apk --update add --virtual=build-dependencies g++ git \
    && apk add libstdc++ \
    && git clone https://github.com/hodgesmr/fs2comma-linux-patch.git \
    && cd fs2comma-linux-patch \
    && g++ -w -o fs2comma *.cpp \
    && apk del build-dependencies \
    && mv /opt/fs2comma/fs2comma-linux-patch/fs2comma /usr/bin \
    && cd - \
    && rm -r fs2comma-linux-patch

USER nobody

ARG BUILD_DATE
ARG NAME
ARG ORG
ARG VCS_REF
ARG VENDOR
ARG VERSION

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name=$NAME \
      org.label-schema.description="fs2comma container" \
      org.label-schema.url="https://github.com/${ORG}/${NAME}" \
      org.label-schema.vcs-url="https://github.com/${ORG}/${NAME}" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vendor=$VENDOR \
      org.label-schema.version=$VERSION \
      org.label-schema.docker.schema-version="1.0" \
      org.label-schema.docker.cmd="docker run ${ORG}/${NAME}"

ENTRYPOINT ["fs2comma"]

