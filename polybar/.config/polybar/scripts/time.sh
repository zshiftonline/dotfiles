#!/bin/bash

time=$(date | awk '//{print $5}' | awk '{ print substr( $0, 1, length($0)-3 ) }')
ampm=$(date | awk '//{print $6}')

echo $time $ampm
