#!/bin/csh -f

set DATA DIR = `pwd` 
set RPT_DIR = $DATA DIR/report 
set DRC_FILE = $RPT DIR/calibredrc.inp 
set ANT_FILE = $RPT DIR/calibreant.inp 
set LVS_FILE = $RPT DIR/calibrelvs.inp 
set LOGFILE = $RPT DIR/README.jdlin.txt 

cat $RPT DIR/info.txt > $LOGFILE 
echo "DRC deck no & version :" >> $LOGFILE 
grep "DESIGN RULE" $DRC_FILE >> $LOGFILE 
grep "COMMAND FILE" $DRC_FILE >> $LOGFILE 
echo "Antenna deck no & version :" >> $LOGFILE 
grep "DESIGN RULE" $ANT_FILE >> $LOGFILE 
grep "COMMAND FILE" $ANT_FILE >> $LOGFILE 
cat $RPT_DIR/sum.rpt >> $LOGFILE 
echo "Antenna check ..." >> $LOGFILE 
cat $RPT_DIR/antenna.rpt >> $LOGFILE 
echo "LVS deck no & version :" >> $LOGFILE 
grep "COMMAND FILE" $LVS FILE >> $LOGFILE 
#grep '@(^)' $LVS FILE » LOGFILE 
cat $RPT_DIR/lvs.rpt » $LOGFILE 
\rm $RPT_DIR/sum.rpt
