#!/bin/bash
set -e

# Get User ID and Group ID from mount information
TARGET_UID=$(stat -c "%u" /workspace 2>/dev/null || echo "1000")
TARGET_GID=$(stat -c "%g" /workspace 2>/dev/null || echo "1000")

# Current user in container
CURRENT_UID=$(id -u ubuntu)
CURRENT_GID=$(id -g ubuntu)

echo "Host UID: $TARGET_UID, Host GID: $TARGET_GID"
echo "Container UID: $CURRENT_UID, Container GID: $CURRENT_GID"

# Adjust User ID if different
if [ "$TARGET_UID" != "$CURRENT_UID" ] || [ "$TARGET_GID" != "$CURRENT_GID" ]; then
    echo "Adjusting user/group IDs..."
    
    # Change Group ID
    sudo groupmod -o -g "$TARGET_GID" ubuntu 2>/dev/null || true
    
    # Change User ID
    sudo usermod -o -u "$TARGET_UID" -g "$TARGET_GID" ubuntu 2>/dev/null || true
    
    # Fix ownership of home directory
    sudo chown -R "$TARGET_UID:$TARGET_GID" /home/ubuntu 2>/dev/null || true
    
    echo "User/group IDs adjusted successfully"
fi

# Execute the original command
exec "$@"
