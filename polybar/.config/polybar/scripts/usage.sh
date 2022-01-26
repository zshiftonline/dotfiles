#/bin/bash

usage=$(df -h / | grep -vE "^Filesystem" | awk '//{print $5}')

echo $usage
