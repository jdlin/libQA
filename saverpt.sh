#!/bin/csh -f 

set DATA_DIR = `pwd`
set DRC_DIR = $DATA_DIR/run_drc 
set LVS_DIR = $DATA_DIR/run_Ivs 
set ANT_DIR = $DATA_DIR/run_ant 
set RPT_DIR = $DATA_DIR/report 
set CEL_LIS = $DATA DIR"/cell_list" 
set LOG_FILE = $DATA_DIR/report/report.log 
mkdir $RPT_DIR 
date > $LOG_FILE 

set namelist = (`cat $CEL_LIS`) 

cd $DRC_DIR 
foreach CEL_NAM ($namelist) 
    set RPT_PRIMARY = `echo $CEL_NAM` 
    # | tr '[a-z]' '[A-Z]' 
    set RPT_FILE = $DRC_DIR/$RPT_PRIMARY/$RPT_PRIMARY.rep 
    set DRC_FILE = $DRC_DIR/$RPT_PRIMARY/calibredrc.inp 
    if (! -f $RPT_FILE) then 
        echo $RPT_FILE" does not exist" >> $LOG_FILE 
    else 
        cp -p $DRC_FILE $RPT_DIR 
        echo "DRC rule deck :" $DRC_FILE >> $LOG_FILE 
        cp -p $RPT_FILE $RPT_DIR/$RPT_PRIMARY.drc.rep 
        echo "DRC Report File :" $RPT_FILE >> $LOG FILE 
    endif 
end 
cd ..

cd $LVS_DIR 
foreach CEL_NAM ($namelist) 
    set RPT_PRIMARY = `echo $CEL_NAM`
    # | tr '[a-z]' '[A-Z]' 
    set RPT_FILE = $LVS_DIR/$RPT_PRIMARY/$RPT_PRIMARY.rep 
    set LVS_FILE = $LVS_DIR/$RPT_PRIMARY/calibrelvs.inp 
    if (! ~f $RPT_FILE) then 
        echo $RPT_FILE" does not exist" >> $LOG_FILE 
    else 
        cp -p $LVS_FILE $RPT_DIR 
        echo "LVS rule deck :" $LVS FILE >> $LOG FILE 
        cp -p $RPT_FILE $RPT_DIR/$RPT_PRIMARY.lvs.rep 
        echo "LVS Report File :" $RPT_FILE >> $LOG_FILE 
    endif 
end 
cd .. 

cd $ANT_DIR 
foreach CEL_NAM ($namelist) 
    set RPT_PRIMARY = `echo $CEL_NAM`
    # I tr '[a-z]' '[A-Z]'
    set RPT_FILE = $ANT_DIR/$RPT_PRIMARY/$RPT_PRIMARY.rep 
    set ANT~FILE = $ANTDIR/$RPT_PRIMARY/calibreant.inp 
    if (! -f $PPT_FILE) then 
        echo $RPT_FILE" does not exist" >> $LOG_FTLe 
    else 
        cp -p $ANT_FILE $RPT_DIR 
        echo'"Antenna check rule deck :" $ANT_FILE >> $LOG_FILE 
        cp -p $RPT_FILE $RPT_DIR/$RPT_PRIMARY.antenna.rep 
        echo "Antenna Report 'File :" $RPT_FILE >> $LOG_FILE 
    endif 
end 
cd .. 

mv *.rpt $RPT_DIR 
mv cell_list $RPT_DIR 
if (-f info.txt) then 
    mv info.txt $RPT_DIR 
endif 
echo "end of copy ..."
