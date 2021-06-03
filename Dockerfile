FROM rust:1.51 as planner
RUN cargo install cargo-chef
COPY agora/. /root/agora
WORKDIR /root/agora
RUN cargo chef prepare --recipe-path recipe.json

FROM rust:1.51
RUN cargo install cargo-chef
WORKDIR /root/agora
COPY --from=planner /root/agora/recipe.json recipe.json
RUN cargo chef cook --release --recipe-path recipe.json

COPY agora/. /root/agora
RUN cargo build --release
RUN cp target/release/agora /usr/local/bin
