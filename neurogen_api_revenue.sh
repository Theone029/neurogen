#!/bin/bash

source .env

while true
do
    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    OUTPUT_DIR="./NEUROGEN_OUTPUT"
    OUTPUT_FILE="$OUTPUT_DIR/article_$TIMESTAMP.txt"

    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi

    RESPONSE=$(curl -s https://api.openai.com/v1/chat/completions \
      -H "Authorization: Bearer $OPENAI_API_KEY" \
      -H "Content-Type: application/json" \
      -d '{
        "model": "gpt-3.5-turbo",
        "messages": [{"role": "user", "content": "Write a 500-word article promoting the best tech gadgets with Amazon and eBay affiliate links."}],
        "max_tokens": 1000
      }')

    CONTENT=$(echo $RESPONSE | jq -r '.choices[0].message.content')

    CONTENT=$(echo "$CONTENT" | sed "s/Amazon/Amazon (Affiliate ID: $AMAZON_AFFILIATE_ID)/g")
    CONTENT=$(echo "$CONTENT" | sed "s/eBay/eBay (Affiliate ID: $EBAY_AFFILIATE_ID)/g")

    echo "$CONTENT" > "$OUTPUT_FILE"
    echo "✅ Generated: $OUTPUT_FILE"

    sleep 3600
done
