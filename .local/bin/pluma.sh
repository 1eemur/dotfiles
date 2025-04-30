#!/bin/bash

# pluma.sh - Append clipboard content to a specified file
# Usage: ./pluma.sh filename

# Check if a filename was provided
if [ $# -ne 1 ]; then
    echo "Error: Please provide a filename as an argument"
    echo "Usage: $0 filename"
    exit 1
fi

# Check if xclip is installed
if ! command -v xclip &> /dev/null; then
    echo "Error: xclip is not installed"
    echo "Please install it with: sudo apt-get install xclip (Debian/Ubuntu)"
    echo "or: sudo yum install xclip (Fedora/CentOS)"
    exit 1
fi

# Get the target file from command line argument
TARGET_FILE="$1"

# Check if the target file exists and is writable, or can be created
if [ -f "$TARGET_FILE" ] && [ ! -w "$TARGET_FILE" ]; then
    echo "Error: File '$TARGET_FILE' exists but is not writable"
    exit 1
elif [ ! -f "$TARGET_FILE" ] && [ ! -w "$(dirname "$TARGET_FILE")" ]; then
    echo "Error: Cannot create file '$TARGET_FILE' (directory not writable)"
    exit 1
fi

# Append clipboard content to the specified file as a new line
# First check if file exists and doesn't end with newline
if [ -f "$TARGET_FILE" ] && [ -s "$TARGET_FILE" ]; then
    # Check if the file doesn't end with a newline
    if [ "$(tail -c1 "$TARGET_FILE" | wc -l)" -eq 0 ]; then
        # Add a newline first
        echo "" >> "$TARGET_FILE"
    fi
fi

# Append clipboard content
xclip -o >> "$TARGET_FILE"
# Add a newline after the content
echo "" >> "$TARGET_FILE"

# Check if the operation was successful
if [ $? -eq 0 ]; then
    echo "Clipboard content appended to '$TARGET_FILE'"
else
    echo "Error: Failed to append clipboard content to '$TARGET_FILE'"
    exit 1
fi

exit 0
