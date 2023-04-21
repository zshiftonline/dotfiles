#!/bin/sh

FONT='36'
BLANK='#00000000'
CLEAR='#b58db6'
DEFAULT='#bd6c90cc'
TEXT='#b3e774aa'
WRONG='#dd000088'
VERIFYING='#227755bb'

i3lock \
--ignore-empty-password       \
--insidever-color=$CLEAR      \
--ringver-color=$VERIFYING    \
\
--insidewrong-color=$TEXT     \
--ringwrong-color=$TEXT       \
\
--inside-color=$BLANK         \
--ring-color=$DEFAULT         \
--line-color=$BLANK           \
--separator-color=$DEFAULT    \
\
--verif-color=$TEXT           \
--wrong-color=$TEXT           \
--time-color=$TEXT            \
--date-color=$TEXT            \
--greeter-color=$WRONG        \
--layout-color=$TEXT          \
--bshl-color=$TEXT            \
\
--color=08080844              \
--screen=1                    \
--clock                       \
--time-str="%H:%M:%S %P"      \
--date-str="%A, %B %d, %Y"    \
--time-size=70                \
--date-size=$FONT             \
--layout-size=$FONT           \
--verif-size=$FONT            \
--wrong-size=$FONT            \
--greeter-size=30             \
--radius 220                  \
--time-pos="w-(w/4):h-(h/4)"            \
--date-pos="tx+(w*.01):ty+(h*.05)"      \
--greeter-pos="tx+(w*.02):ty-(h*.07)"   \
--greeter-text="Locked"                 \
--bar-indicator                         \
--bar-pos y+h                           \
--bar-direction 1                       \
--bar-max-height 15                     \
--bar-base-width 15                     \
--bar-color 10101077                    \
--keyhl-color 888888cc                  \
--bar-periodic-step 20                  \
--bar-step 20                           \
--redraw-thread                         \
--verif-text="verifying..."             \
--wrong-text="incorrect password"       \
--noinput-text="invalid password"       \
