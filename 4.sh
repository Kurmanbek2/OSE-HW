#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: ./convert.sh <number> <unit>"
    exit 1
fi

num="$1"
unit="$2"

if (( $(echo "$num < 0" | bc -l) )); then
    echo "Number must not be negative"
    exit 3
fi


case "$unit" in
    km|KM)
        res=$((num * 1000))
        echo "$num km = $res m"
        ;;
    m|M)
        res=$((num * 100))
        echo "$num m = $res cm"
        ;;
    h|H)
        res=$((num * 60))
        echo "$num h = $res min"
        ;;
    min|MIN)
        res=$((num * 60))
        echo "$num min = $res s"
        ;;
    kg|KG)
        res=$((num * 1000))
        echo "$num kg = $res g"
        ;;
    *)
     
        echo "Unknown unit: $unit"
        echo "Units: km m h min kg"
        exit 2
        ;;
esac