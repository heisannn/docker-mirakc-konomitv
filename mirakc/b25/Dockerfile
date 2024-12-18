FROM alpine AS b25-build
RUN apk add --no-cache cmake git g++ libtool make pkgconf pcsc-lite-dev
RUN git clone --depth=1 https://github.com/tsukumijima/libaribb25.git /src
RUN cmake -S /src -B /build -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/opt/libaribb25
RUN make -C /build -j $(nproc)
RUN make -C /build install

FROM alpine
COPY --from=b25-build /opt/libaribb25 /usr/local/
COPY ./main.sh /
RUN apk add --no-cache ccid libgcc libstdc++ musl pcsc-lite-libs socat tzdata
EXPOSE 40773
ENTRYPOINT ["/bin/sh", "/main.sh"]

