FROM rust:1.86.0-slim

RUN apt-get update && apt-get install -y libwebkit2gtk-4.1-dev \
    build-essential \
    curl \
    wget \
    file \
    libxdo-dev \
    libssl-dev \
    libayatana-appindicator3-dev \
    librsvg2-dev\
    && rm -rf /var/lib/apt/lists/*

RUN cargo install dioxus-cli --version 0.6.3
RUN rustup target add x86_64-unknown-linux-gnu
