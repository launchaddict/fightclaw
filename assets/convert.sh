#!/bin/bash

# Claw Club Asset Conversion Script
# Converts SVG assets to PNG for upload to X, Discord, etc.

echo "🥊 Claw Club Asset Converter"
echo "============================="
echo ""

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null; then
    echo "⚠️  ImageMagick not found."
    echo ""
    echo "Install options:"
    echo "  macOS: brew install imagemagick"
    echo "  Ubuntu/Debian: sudo apt-get install imagemagick"
    echo "  Windows: Download from imagemagick.org"
    echo ""
    echo "Or use online converters like:"
    echo "  - CloudConvert.com"
    echo "  - SVGtoPNG.com"
    echo "  - vectormagic.com"
    exit 1
fi

# Convert profile image
echo "Converting profile.svg → profile.png (400x400)..."
convert profile.svg -resize 400x400 profile.png

# Convert header image
echo "Converting header.svg → header.png (1500x500)..."
convert header.svg -resize 1500x500 header.png

# Convert favicon
echo "Converting favicon.svg → favicon.png (32x32)..."
convert favicon.svg -resize 32x32 favicon.png

# Convert OG image
echo "Converting og-image.svg → og-image.png (1200x630)..."
convert og-image.svg -resize 1200x630 og-image.png

# Convert tall banner
echo "Converting banner-tall.svg → banner-tall.png (800x3200)..."
convert banner-tall.svg -resize 800x3200 banner-tall.png

echo ""
echo "✅ All assets converted successfully!"
echo ""
echo "Files created:"
echo "  - profile.png (400x400) - For X/Twitter profile"
echo "  - header.png (1500x500) - For X/Twitter header"
echo "  - favicon.png (32x32) - For website favicon"
echo "  - og-image.png (1200x630) - For social shares"
echo "  - banner-tall.png (800x3200) - For Discord servers"
echo ""
echo "🥊 Ready to upload to X/Twitter!"
