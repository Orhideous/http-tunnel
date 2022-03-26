FROM rust:1-alpine3.15 AS builder
RUN apk add --no-cache musl-dev openssl-dev

WORKDIR /build
COPY ./ .
RUN cargo build --release --features plain_text

FROM alpine:3.15
COPY --from=builder /build/target/release/http-tunnel /usr/local/bin/
