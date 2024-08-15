FROM rust:1.80-alpine3.19
WORKDIR /hellorust
COPY . .
RUN cargo build --release
RUN rustup component add clippy
RUN cargo clippy

FROM bitnami/minideb:bookworm
WORKDIR /root/
COPY --from=0 /hellorust/target/release/hello .


CMD ["./hello"]
