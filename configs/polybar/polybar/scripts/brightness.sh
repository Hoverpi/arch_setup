#!/bin/bash

# Obtener el porcentaje actual de brillo
get_brightness() {
    brightnessctl get
}

# Obtener el brillo máximo
get_max_brightness() {
    brightnessctl max
}

# Calcular el porcentaje de brillo
get_percentage() {
    current=$(get_brightness)
    max=$(get_max_brightness)
    echo $(( 100 * current / max ))
}

# Incrementar el brillo
increase_brightness() {
    brightnessctl set +5%
}

# Decrementar el brillo
decrease_brightness() {
    brightnessctl set 5%-
}

# Mostrar el estado del brillo con icono y colores
status() {
    percentage=$(get_percentage)
    if [ "$percentage" -ge 80 ]; then
        icon="%{F#FFFF00}󰃠%{F-}"  # Icono Full Brightness en amarillo
    elif [ "$percentage" -ge 60 ]; then
        icon="%{F#FFD700}󰃟%{F-}"  # Icono High Brightness en naranja amarilloso
    elif [ "$percentage" -ge 40 ]; then
        icon="%{F#FFA500}󰃝%{F-}"  # Icono Medium Brightness en naranja
    elif [ "$percentage" -ge 20 ]; then
        icon="%{F#87CEEB}󰃛%{F-}"  # Icono Low Brightness en azul claro
    else
        icon="%{F#0000FF}󰃚%{F-}"  # Icono Very Low Brightness en azul
    fi
    echo "$icon $percentage%"
}

# Manejar los argumentos del script
case "$1" in
    up)
        increase_brightness
        ;;
    down)
        decrease_brightness
        ;;
    status)
        status
        ;;
    *)
        echo "Usage: $0 {up|down|status}"
        exit 1
        ;;
esac

