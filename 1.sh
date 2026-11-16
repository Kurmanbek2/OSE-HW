
#!/bin/bash

if [ "$#" -eq 1 ]; then
    c="$1"
elif [ "$#" -eq 0 ]; then
    IFS= read -r c
else
    echo "Usage: ./script.sh <celsius>"
    exit 1
fi

f=$((c * 9 / 5 + 32))

if (( c < 0 && (c * 9) % 5 != 0 )); then
    f=$((f - 1))
fi

echo "${c}C = ${f}F"

if (( c < 0 )); then
    echo "Freezing"
elif (( c <= 14 )); then
    echo "Cold"
elif (( c <= 29 )); then
    echo "Warm"
else
    echo "Hot"
fi
