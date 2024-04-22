#!/bin/bash

contratar=1

read -p "Indique en qué población reside: " lugar
read -p "¿Cuántos años tiene?: " edad
read -p "¿Cuántos años de experiencia tiene en un puesto como este?: " experiencia
read -p "¿Tiene disponibilidad para viajar?: " viajar
read -p "¿Qué nivel de inglés tiene certificado?: " nivel

sleep 1.5
echo ""

if [[ $(tr '[:upper:]' '[:lower:]' <<< $lugar) == "bilbao" ]]; then

  echo "Veo que reside usted en Bilbao. Eso está bien."

else

  contratar=0
  echo "Usted reside en $lugar, por lo que no es de Bilbao. Umm..."

fi

sleep 1.5
echo ""

if [[ $edad -ge 18 ]]; then

  echo "Por supuesto, con $edad años, es usted mayor de edad."

else

  contratar=0
  echo "$edad años... ¿No es usted un poco joven para buscar trabajo?"

fi

sleep 1.5
echo ""

if [[ $experiencia -gt 1 ]]; then

  echo "Es interesante que tenga $experiencia años en este campo."

elif [[ $experiencia -eq 1 ]]; then

  echo "$experiencia año de experiencia será suficiente."

else

  contratar=0
  echo "Lleva poco tiempo en esta clase de trabajo. Entiendo."

fi

sleep 1.5
echo ""

if [[ $(tr '[:upper:]' '[:lower:]' <<< ${viajar:0:1}) == "s" ]]; then

  echo "Le esperan grandes viajes si se queda con nosotros."

else

  contratar=0
  echo "Tiene la obligación de quedarse aquí. Ajá."

fi

sleep 1.5
echo ""

if [[ $(tr '[:upper:]' '[:lower:]' <<< ${nivel:0:1}) == "b" ]] || [[ $(tr '[:upper:]' '[:lower:]' <<< ${nivel:0:1}) == "c" ]]; then

  echo "$nivel level in English is a nice mark, isn't it?"

else

  contratar=0
  echo "Con un nivel $nivel acreditado, va a tener dificultades para encajar aquí."

fi

sleep 2
echo ""

if [ $contratar -eq 1 ]; then

  echo "Felicidades, puede optar al puesto."

else

  echo "Lo siento, me temo que no vamos a poder contar con usted para este puesto."

fi
