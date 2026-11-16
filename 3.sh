#!/bin/bash


if [ "$#" -ne 1 ]; then
    echo "Usage: ./backup.sh <file>"
    exit 1
fi

file="$1"

if [ ! -e "$file" ]; then
    echo "Not found: $file"
    exit 2
fi

if [ -d "$file" ]; then
    echo "$file is a directory, not a file"
    exit 3
fi

if [ ! -r "$file" ]; then
    echo "Cannot read: $file"
    exit 4
fi

today=$(date +%F)


dest="${file}.${today}.bak"
cp "$file" "$dest"


size=$(wc -c < "$dest")
echo "Backup created: $dest ($size bytes)"