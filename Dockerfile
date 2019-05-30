# Oracle Java 8
FROM java:8

# Set the Forge version to download
ARG FORGE_VERSION=1.12.2-14.23.4.2705

# Create the appuser and appgroup and create/chown the forge directories
RUN groupadd -g 999 appgroup && \
    useradd -r -u 999 -g appgroup appuser && \
    mkdir -pv /forge/server /forge/app && \
    chown -R appuser:appgroup /forge

# Set the user to appuser
USER appuser

# Download and install forge
RUN cd /forge/app && \
    wget -O forge-installer.jar "https://files.minecraftforge.net/maven/net/minecraftforge/forge/${FORGE_VERSION}/forge-${FORGE_VERSION}-installer.jar" && \
    java -jar forge-installer.jar --installServer && \
    rm forge-installer.jar

# Add the entrypoint script
ADD entrypoint.sh /forge/entrypoint.sh

# Set the Forge version as an env var, so the entrypoint can use it
ENV FORGE_VERSION=${FORGE_VERSION}

# Set the server data dir as the working directory
VOLUME ['/forge/server']
WORKDIR /forge/server

# Expose the default minecraft port
EXPOSE 25565

# Set the entrypoint script as entrypoint
ENTRYPOINT ["/forge/entrypoint.sh"]
