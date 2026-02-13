#!/bin/bash

echo "🥊 Claw Club - Using Online Converter API"
echo "========================================"
echo ""
echo "Installing imagemagick would be fastest, but let's try online APIs..."
echo ""

# Try using convertio API
echo "Attempting to convert via convertio.co..."
echo ""

for file in profile header favicon og-image banner-tall; do
    input="${file}.svg"
    output="${file}.png"

    echo "Processing $input..."

    # Using convertio's free API
    response=$(curl -s -X POST \
        -F "file=@$input" \
        -F "filename=$input" \
        -F "outputformat=png" \
        "https://api.convertio.co/convert")

    echo "Response for $file: ${response:0:200}..."
    echo ""

    # Extract download URL from response if successful
    download_url=$(echo "$response" | grep -o '"url":"[^"]*"' | cut -d'"' -f4)

    if [ -n "$download_url" ]; then
        echo "Downloading from: $download_url"
        curl -s -o "$output" "$download_url"
        if [ -f "$output" ]; then
            echo "✅ $output created ($(ls -lh "$output" | awk '{print $5}))"
        else
            echo "❌ Failed to download $output"
        fi
    else
        echo "❌ Failed to convert $input"
    fi
    echo ""
    sleep 2  # Rate limiting
done

echo ""
echo "Done! Check for PNG files."
