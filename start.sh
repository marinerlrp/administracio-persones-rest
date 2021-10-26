#!/bin/bash

#
# Sobreescriu el fitxer /home/tcuser/start.sh provinent de la imatge base
# (per facilitat per fer proves)
#

case $# in
  # si es passen 3 arguments
  3) export ENTORN=$1
     export VERSIO=$3
     export CONTEXT=$2
     export APL=$CONTEXT;;
  # si es passen 4 argument es snapshot
  4) export ENTORN=$1
     export VERSIO=$3
     export CONTEXT=$2
     export APL=$CONTEXT
     export SNAPSHOT=$4;;
  5) export ENTORN=$1
     export VERSIO=$3
     export CONTEXT=$2
     export APL=$CONTEXT
     export SNAPSHOT=$4
     export CANVI_NOM_APL=$5;;  
  # si es passen altre nombre de  arguments
  *) echo
     echo "Els paràmetres esperats són:"
     echo
     echo "$ ./start.sh entorn context versio snapshot"
     exit 1;;
esac

cd /home/tcuser/bin
echo "Carregam entorn"
#. profile.llorenc.sh
. profile.sh
. set.llorenc $ENTORN
env
echo "Executam configAplLocal per $APL"
./configAplLocal.llorenc.sh $APL $CANVI_NOM_APL
echo "Executam predesplegar per $APL i $VERSIO"
./predesplegar.llorenc.sh $APL $VERSIO all $SNAPSHOT
echo "Executam despLocal"
./desplLocal.llorenc.sh
echo "Posam agent jolokia dins webapps"
/bin/cp /home/tcuser/server/webapps/jolokia.war /home/tcuser/server/$ENTORN/webapps/jolokia.war
