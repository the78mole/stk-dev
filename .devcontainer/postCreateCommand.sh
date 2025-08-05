#!/usr/bin/env bash

echo "Creating stk-assets folder if it does not exist..."

cd /workspace 
if [ ! -d 'stk-assets' ]; then 
    mkdir -p 'stk-assets'
fi