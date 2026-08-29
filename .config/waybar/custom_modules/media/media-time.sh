#!/usr/bin/env bash

playerctl --player=spotify metadata --format '{{duration(position)}}/{{duration(mpris:length)}}' 2>/dev/null