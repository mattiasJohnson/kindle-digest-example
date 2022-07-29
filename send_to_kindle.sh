#!/bin/bash

# Create paths
RECIPE_PATH="recipes/$1"
RECIPE_BASENAME=$(basename $1 .recipe)
DIGEST_PATH="articles/$(date +"%Y-%m-%d")_${RECIPE_BASENAME}.mobi"


# Convert rss feeds to .mobi
ebook-convert $RECIPE_PATH $DIGEST_PATH

# Send digest to kindle
calibre-smtp -a $DIGEST_PATH -u sending_mail@gmail.com -p kciwxnalibyejqma -r smtp.gmail.com --port 587 sending_mail@gmail.com my_kindles_mail@kindle.com ''
