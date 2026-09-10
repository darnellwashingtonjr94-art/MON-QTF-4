FROM ghcr.io/foundry-rs/foundry:latest

WORKDIR /app

COPY foundry.toml remappings.txt ./
COPY src ./src
COPY test ./test
COPY script ./script
COPY lib ./lib
COPY engines ./engines
COPY config ./config

RUN forge build --sizes

ENTRYPOINT ["forge", "test"]
