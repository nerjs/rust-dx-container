FROM rust:1.86.0-slim

LABEL org.opencontainers.image.title="rust-dx CI image"
LABEL org.opencontainers.image.description="Minimal Rust + Dioxus CI image with preinstalled toolchain and system libs"
LABEL org.opencontainers.image.version="1.1.0"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.authors="nerjs"
LABEL org.opencontainers.image.source="https://github.com/nerjs/rust-dx-container"
LABEL org.opencontainers.image.created="${BUILD_DATE}"

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

RUN rustup component add rustfmt clippy
RUN rustup target add x86_64-unknown-linux-gnu
RUN rustup target add wasm32-unknown-unknown

RUN cargo install dioxus-cli --version 0.6.3
