#!/bin/bash

# Stop on any error, and print all commands
set -e
set -x

# Set environment variables
export FORGE_MAX_HEAP=${FORGE_MAX_HEAP:-1024m}
export FORGE_MIN_HEAP=${FORGE_MIN_HEAP:-1024m}
export FORGE_JAR="/forge/app/forge-${FORGE_VERSION}-universal.jar"

# If the eula does not exist or is set to false, set it to true
if [ ! -f "eula.txt" ] || [ grep -Fxq "eula=false" eula.txt ]; then
  echo "eula=true" > eula.txt
fi

# Run the Forge server
java -Xms${FORGE_MIN_HEAP} -Xmx${FORGE_MAX_HEAP} -jar ${FORGE_JAR} nogui
