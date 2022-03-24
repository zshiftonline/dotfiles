#!/bin/bash

time=$(date | awk '//{print $4}' | awk '{ print substr( $0, 1, length($0)-3 ) }')
ampm=$(date | awk '//{print $5}')

echo $time $ampm
