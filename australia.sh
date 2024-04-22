#!/bin/bash

autorizar=1

read -p "¿Cuántos meses estará en vigencia su pasaporte?: " vigencia
read -p "¿Cuántos días planea quedarse?: " estancia
read -p "¿Tiene usted antecedentes penales?: " antecedentes

sleep 1.5
echo ""

if [[ $vigencia -ge 6 ]]; then

  echo "Con $vigencia meses de vigencia de pasaporte, no habrá ningún problema por esta parte."

else

  autorizar=0
  echo "$vigencia meses de vigencia de pasaporte no bastarán independientemente de su período de estancia."

fi

sleep 1.5
echo ""

if [[ $estancia -le 90 ]]; then

  echo "Le dará tiempo a ver unas cuantas cosas durante su estancia de $estancia días."

else

  autorizar=0
  echo "$estancia días es mucho tiempo, necesitará otro tipo de permiso."

fi

sleep 1.5
echo ""

if [[ $(tr '[:upper:]' '[:lower:]' <<< ${antecedentes:0:1}) == "n" ]]; then

  echo "La gente de bien es bien recibida en Australia."

else

  autorizar=0
  echo "En Australia no ven con buenos ojos su situación penal."

fi

sleep 2
echo ""

if [[ $autorizar -eq 1 ]]; then

  echo "¡Felicidades! Tiene permiso para viajar a Australia. ¡Que tenga un buen viaje!"

else

  echo "Lo sentimos. El permiso para viajar a Australia le ha sido denegado."

fi
