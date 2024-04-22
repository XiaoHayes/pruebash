# El shebang apunta al shell de bash:

#!/bin/bash

#Solicitamos los datos de un usuario para que el administrador los introduzca mediante teclado.
read -p "Introduzca el nombre de usuario: " user_name
read -p "Introduzca la ruta de su directorio personal: " user_path

#Comprobamos si el usuario y directorio indicados existen.
if id $user_name &>/dev/null && [ -d $user_path &>/dev/null ]; then

  #Si así es, se lo confirmamos al administrador y le ofrecemos modificar los permisos de ese usuario.
  echo "Usuario y directorio confirmados."

  #Primero recogemos los datos de permisos de ese usuario empleando la información recibida.
  user_access=$(sudo -u $user_name stat -c "%A" $user_path)
  echo "Permisos de acceso del usuario $user_name al directorio $user_path: $user_access"

  #Luego damos la ocasión al administrador de cambiar esos permisos si lo considera oportuno.
  read -p "¿Desea modificar sus permisos de usuario? (S/n): " modificar
  if [ $modificar == "S" ] || [ $modificar == "s" ]; then

    #Mostramos información útil para facilitar las modificaciones y solicitamos los nuevos permisos en formato octal.
    echo "0: ---"
    echo "1: --x"
    echo "2: -w-"
    echo "3: -wx"
    echo "4: r--"
    echo "5: r-x"
    echo "6: rw-"
    echo "7: rwx"
    #AVISO: No hay control de errores en la entrada de permisos. El comando chmod dará error si los datos no son válidos;
    #el programa dirá que ha modificado los permisos, pero no hará ningún cambio en ellos tras ese error.
    read -p "Introduzca permisos para usuario, grupo, y otros, un valor de la lista para cada uno (nnn): " user_values

    #Modificamos los permisos según los ajustes introducidos...
    sudo chmod $user_values $user_path
    #...Recuperamos la información modificada...
    user_access=$(sudo -u $user_name stat -c "%A" $user_path)
    #...Y confirmamos los cambios por pantalla.
    echo "Los permisos han sido modificados."
    echo "Estos son los nuevos permisos del usuario $user_name al directorio $user_path: $user_access"

  elif [ $modificar == "N" ] || [ $modificar == "n" ]; then

    #En caso de que el administrador rechace realizar modificaciones, indicamos el resultado de esa decisión.
    echo "Los permisos se conservarán sin cambios."

  else

    #Si la respuesta es incorrecta, tampoco se realizarán cambios.
    echo "No ha introducido una respuesta válida. No podrá modificar los permisos."

  fi

else
  #En caso de que la información indicada no sea correcta, lo indicamos por pantalla.
  echo "No existe ese usuario o ese directorio."

fi

#Una vez hecho todo, indicamos el fin del programa.
echo "Fin del programa."
