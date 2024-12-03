#!/bin/bash

# Define los iconos que quieres usar para cada escritorio.
icons=("" "" "" "" "" "")

counter=0
bspc query -D --names | while read -r name; do
  icon="${icons[$counter]}"
  if [ -z "$icon" ]; then
    icon="" # Icono por defecto si no hay suficientes iconos en el array.
  fi
  printf 'ws-icon-%i = "%s;%s"\n' $((counter++)) "$name" "$icon"
done

