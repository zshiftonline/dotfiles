#!/bin/bash

TEMP="$(sensors | grep CPU: | awk '{print substr($2,2,4)}')"
echo -e "$TEMP"

