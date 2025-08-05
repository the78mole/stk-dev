#!/bin/bash

# Set User-IDs as environment variables
export USER_UID=$(id -u)
export USER_GID=$(id -g)

echo "Setting USER_UID=$USER_UID and USER_GID=$USER_GID"

# Start the DevContainer
code .
