#!/bin/csh -f 

set TECH = `pwd ! awk ~F/ '{print $5}'
echo 'Technology = '$TECH

set DRC_FILE = $HOME"/lib/"$TECH"/calibre/drc.com"
set LVS_FILE = $HOME"/lib/"$TECH"/calibre/lvs.com"
set ANT_FILE = $HOME"/lib/"$TECH"/calibre/antenna.com"
set MAKE_FILE == $HOME"/bin/run/Makefile"

if (! -f $DRC_FILE) then
    echo "drc.com NOT FOUND !"
else
    echo $DRC_FILE 
    ln -s $DRC_FILE
endif

if (! -f $LVS_FILE) then
    echo "lvs.com NOT FOUND !"
else
    echo $LVS_FILE 
    ln -s $LVS_FILE 
endif 

if (! -f $ANT_FILE) then
    echo "antenna.com NOT FOUND !" 
else
    echo $ANT_FILE 
    ln -s $ANT_FILE
endif

if (! -f $MAKE_FILE) then
    echo "Makefile NOT FOUND !" 
else
    echo $MAKE_FILE 
    ln -s $MAKE_FILE
endif

make
