#!/bin/bash

# Set the download and destination folders
DOWNLOADS_FOLDER="$HOME/Downloads"
DESTINATION_FOLDER="$HOME/Documents/IMG"

# Create the destination folder if it doesn't exist
mkdir -p "$DESTINATION_FOLDER"

# Move all files that start with "IMG" from the downloads folder to the destination folder
mv "$DOWNLOADS_FOLDER"/IMG* "$DESTINATION_FOLDER"