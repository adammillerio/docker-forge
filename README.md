# docker-sponge-forge
Docker image for the SpongeForge MineCraft server

# Usage

## Running

The server will store data in `/forge/server`, so it should be mounted in as a Docker volume. This directory needs to be writeable by the UID:GID 999:999:

```bash
mkdir server
sudo chown 999:999 server
```

Then, run the Docker image:

```bash
docker run --rm -d -v "$PWD:/forge/server:rw" -p 25565:25565 --name=forge adammillerio/forge:latest
```

## Environment Variables

There are only two environment variables:

| Name  | Default  | Description  |
|---|---|---|
| FORGE_MAX_HEAP | 1024m | Max size of the JVM heap |
| FORGE_MIN_HEAP | 1024m | Min size of the JVM heap |
