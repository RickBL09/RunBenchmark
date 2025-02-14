#!/bin/bash
echo "Lenguaje,Tiempo(ms)" > /app/results.csv

for lang in python cpp java node go; do
    cd /app/codes/$lang
    docker build -t benchmark-$lang .
    time=$(docker run --rm benchmark-$lang)
    echo "$lang,$time" >> /app/results.csv
    cd /app/codes
done

cat /app/results.csv
