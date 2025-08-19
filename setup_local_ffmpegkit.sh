#!/bin/bash

# Script to set up locally built FFmpegKit for Android project
# Run this after the FFmpegKit build completes

FFMPEG_KIT_DIR="/Users/mavpa/dev/null/work/mobile/ffmpeg-kit"
PROJECT_DIR="/Users/mavga/dev/null/work/mobile/dh_android"
LOCAL_AAR_DIR="$PROJECT_DIR/libs/ffmpeg-kit-local"

echo "Setting up locally built FFmpegKit..."

# Check if FFmpegKit build completed
if [ ! -d "$FFMPEG_KIT_DIR/prebuilt/bundle-android-aar" ]; then
    echo "❌ FFmpegKit build not complete yet. Please wait for the build to finish."
    echo "You can check progress with: ps aux | grep android.sh"
    exit 1
fi

echo "✅ FFmpegKit build found!"

# Create local AAR directory
mkdir -p "$LOCAL_AAR_DIR"

# Copy the AAR file
echo "📦 Copying FFmpegKit AAR files..."
cp "$FFMPEG_KIT_DIR/prebuilt/bundle-android-aar/ffmpeg-kit-full-6.0-2.aar" "$LOCAL_AAR_DIR/"

if [ $? -eq 0 ]; then
    echo "✅ Successfully copied FFmpegKit AAR to $LOCAL_AAR_DIR"
    echo "📋 Files in local AAR directory:"
    ls -la "$LOCAL_AAR_DIR"
    
    echo ""
    echo "🎉 Setup complete! You can now:"
    echo "1. Uncomment the FFmpegKit usage in your MetadataUtils.kt file"
    echo "2. Run './gradlew build' to test the integration"
    echo "3. Build and run your app"
else
    echo "❌ Failed to copy AAR files"
    exit 1
fi 