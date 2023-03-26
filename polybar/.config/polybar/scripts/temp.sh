#!/bin/bash

CPU="$(sensors | grep CPU: | awk '{print substr($2,2,4)}')"
CPU2="$(sensors | grep CPU_D | awk '{print substr($2,2,4)}')"
MB="$(sensors | grep MB_ | awk '{print substr($2,2,4)}')"
GPU="$(sensors | grep GPU_D | awk '{print substr($2,2,4)}')"

echo -e "  %{F#E58F65}CPU%{F-}  $CPU°/$CPU2°  |  %{F#E58F65}MB%{F-}  $MB°  |  %{F#E58F65}GPU%{F-}  $GPU°"


