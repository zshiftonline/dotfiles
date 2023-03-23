#!/bin/bash

TEMP="$(sensors | grep CPU )"
echo -e "$TEMP"

