#! /bin/sh
#
# arch_tweak.sh
# Copyright (C) 2018 Felix Molero <elhackerlibre@gmail.com>
#
# Distributed under terms of the GPLv3+ license.
#


if [[ $EUID -ne 0 ]]; then
echo "Debe tener privilegio Root para ejecutar" 1>&2
exit 1
fi

echo $(clear)
while true; do

echo ""
echo " Escoja una Opcion. "
echo ""
echo "1. Sincronizar pacman."
echo ""
echo "2. Actualizar Pacman."
echo ""
echo "3. Actualizar Yaourt."
echo ""
echo "4. Verificar espacio en cache."
echo ""
echo "5. Limpiar Cache."
echo ""
echo "6. Limpiar paquetes de huérfanos."
echo ""
echo "7. Instalar programa."
echo ""
echo "8. Desisntalar programa."
echo ""
echo "9. Salir."
echo ""
echo -n "Seleccione una opción: [1-9] :"
read opcion
case $opcion in
1) echo "Actualizando repositorios";
    echo $(clear)
    sudo pacman -Syy ;;
#sudo pacman-mirrors -g;;

2) echo "Actualizando Pacman";
    echo $(clear)
    sudo pacman -Syyu;;

3) echo "Actualizando Yaourt."
    echo $(clear)
    yaourt -Syyu --aur;;

4) echo "Verificando espacio en cache";
    echo $(clear)
    du -lsh /var/cache/pacman/pkg/;;

5) echo "Limpiando Cache.";
    echo $(clear)
    sudo pacman -Scc;;

6) echo "Limpiando paquetes huérfanos.";
    echo $(clear)
    sudo pacman -Rs $(pacman -Qtdq);;

7) echo "Instalar programa :"; 
    echo $(clear)
    echo "Ingrese nombre del paquete que desea instalar"
    read programa
    pacaur -Syy $programa;;

8) echo "Desinstalar programa :";
    echo $(clear)
    echo "Ingrese nombre del paquete que desea desinstalar"
    read programa
    pacaur -Rsc $programa;;

9) echo "Salir."
    echo $(clear)
    exit 1;;
*) echo "$opc es una opción invalida.";
echo "Pulse una tecla para continuar...";
read foo;;
esac
done

