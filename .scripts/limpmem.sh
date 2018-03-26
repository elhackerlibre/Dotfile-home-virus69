##############################################
# Descripción:                               #
#                                            #
# Este script cumple la función de depurar y #
# limpiar lo siguiente:                      #
#                                            #
#   * Limpiar la memoria de la cache         #
#   * Limpiar la memoria SWAP                #
#                                            #
# Author: Virus69                            #
# Email: fmolero69@gmail.com                 #
# Licencia: GPL V2                           #
#                                            #
##############################################

#!/bin/bash
echo “Limpiando la caché~ “;
sync ; echo 3 > /proc/sys/vm/drop_caches
echo “Limpiando Swap~ “;
swapoff -a && swapon -a
