#!/bin/sh

FONT='36'
BLANK='#00000000'
CLEAR='#b58db6'
DEFAULT='#bd6c90cc'
TEXT='#b3e774aa'
WRONG='#880000bb'
VERIFYING='#bb00bbbb'

i3lock \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--greeter-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$WRONG         \
--bshl-color=$WRONG          \
\
--color=101010aa             \
--no-verify \
--screen=1                   \
--clock                      \
--bar-indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%A, %Y-%m-%d"    \
--time-size=70               \
--date-size=$FONT            \
--layout-size=$FONT          \
--verif-size=$FONT           \
--wrong-size=$FONT           \
--greeter-size=$FONT         \
--radius 220                 \
--time-pos="w/4:h/3"        \
--date-pos="w/3:h/3"        \
--greeter-text="TESING"
