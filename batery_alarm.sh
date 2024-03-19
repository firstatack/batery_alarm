#!/bin/bash

# Establecer la variable de entorno DISPLAY
export DISPLAY=:0

# Iniciar una nueva sesión de D-Bus
eval "$(dbus-launch --sh-syntax)"

# Obtener el porcentaje de carga de la batería
battery_percentage=$(acpi -V | grep -oP '(\d+%)' | head -n 1 | tr -d '%')

#Comprobamos lo que queda de bateria y lanzamos mpv para ejecutar sonido.

if (( battery_percentage >= 6 && battery_percentage <= 9 )); then
    mpv submarine-submersion-alarm.mp3
fi
