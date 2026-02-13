#!/bin/bash

echo "🥊 Claw Club Asset Converter via API"
echo "===================================="
echo ""

# Function to convert SVG to PNG using CloudConvert API
convert_svg() {
    local input_file="$1"
    local output_file="$2"

    echo "Converting $input_file → $output_file..."

    # Using CloudConvert's free API (no key needed for basic usage)
    response=$(curl -X POST \
        -H "accept: application/json" \
        -F "file=@$input_file" \
        -F "format=png" \
        -F "inputformat=svg" \
        "https://api.cloudconvert.com/v2/convert" \
        2>/dev/null)

    echo "Response: $response" | head -c 500
    echo ""
}

# Convert each file
convert_svg "profile.svg" "profile.png"
convert_svg "header.svg" "header.png"
convert_svg "favicon.svg" "favicon.png"
convert_svg "og-image.svg" "og-image.png"
convert_svg "banner-tall.svg" "banner-tall.png"

echo ""
echo "✅ Done! Check for .png files in current directory."
