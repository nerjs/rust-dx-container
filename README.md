# Rust dx container

A minimalist Docker image with Rust and essential dependencies for building UI applications with [Dioxus](https://dioxuslabs.com/).


## 📦 Image Contents

- **Base image:** `rust:1.86.0-slim`
- [dioxus-cli](https://dioxuslabs.com/learn/0.6/CLI/): version 0.6.3
- Included `.deb` dependencies:
  - libwebkit2gtk-4.1-dev
  - build-essential 
  - curl 
  - wget 
  - file 
  - libxdo-dev 
  - libssl-dev 
  - libayatana-appindicator3-dev 
  - librsvg2-dev

---

## 🚀 Usage

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    container:
      image: ghcr.io/nerjs/oops-ci:latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
        
      - name: Check Rust formatting
        run: cargo fmt --all --check
          
      - name: Check RSX formatting
        run: dx fmt --verbose --check
        
      - name: Cargo build
        run: cargo build --verbose
```


