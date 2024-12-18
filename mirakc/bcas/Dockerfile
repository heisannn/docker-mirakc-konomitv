FROM alpine
COPY ./main.sh /
RUN apk add --no-cache ccid musl pcsc-lite-libs socat tzdata
EXPOSE 40774
ENTRYPOINT ["/bin/sh", "/main.sh"]

