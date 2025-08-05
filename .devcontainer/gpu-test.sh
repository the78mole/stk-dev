#!/bin/bash

echo "=== GPU/OpenGL Test for SuperTuxKart DevContainer ==="
echo

echo "1. OpenGL Information:"
glxinfo | grep -E "(OpenGL vendor|OpenGL renderer|OpenGL version|OpenGL shading language version)" || echo "glxinfo not available"
echo

echo "2. Direct Rendering Test:"
glxinfo | grep "direct rendering" || echo "glxinfo not available"
echo

echo "3. Mesa Drivers:"
glxgears -info 2>/dev/null | head -5 || echo "glxgears not available"
echo

echo "4. Vulkan Support:"
vulkaninfo --summary 2>/dev/null | head -10 || echo "Vulkan not available"
echo

echo "5. DRI Devices:"
ls -la /dev/dri/ 2>/dev/null || echo "No DRI devices found"
echo

echo "6. X11 Display:"
echo "DISPLAY=$DISPLAY"
xdpyinfo 2>/dev/null | head -5 || echo "X11 display not available"
echo

echo "=== Test completed ==="
