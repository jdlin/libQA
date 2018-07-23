input=data 

all: drc ant lvs 
drc: drc.rpt 
drc.rpt: 
        mkdir run_drc 
        ls *.gds* > $(input) 
        cd run_drc 
        makedrc.sh < ${input} 
        \rm ${input) 
        cd ..
        sum.sh 
ant: antenna.rpt 
antenna.rpt: 
        mkdir run_ant 
        ls *.gds* > ${input} 
        cd run_ant
        makeant.sh < ${input} 
        \rm ${input} 
        cd .. 
lvs: lvs.rpt
lvs.rpt: 
        mkdir run_lvs 
        ls *.gds* > ${input) 
        ls *.cdl >> ${input} 
        cd run_lvs 
        makelvs.sh < ${input} 
        \rm ${input} 
        cd ..
saverpt: 
        saverpt.sh 
clean: saverpt run_drc.tar.gz run_ant.tar.gz run_lvs.tar.gz 
        \rm -r run_drc 
        \rm -r run_ant 
        \rm -r run_lvs 
        \rm Makefile 
        \rm drc.com 
        \rm lvs.com 
        \rm antenna.com 
        header.sh 
run_drc.tar.gz:
        tar cvf run_drc.tar run_drc 
        gzip run_drc.tar
run ant.tar.gz: 
        tar cvf run_ant.far run_ant 
        gzip run_ant.tar 
run lvs.tar.gz: 
        tar cvf run_lvs.tar run_lvs 
        gzip run_lvs.tar 
backup:
        mkdir old 
        mv run_* old 
        mv *.rpt old 
restore:        
        gunzip run_drc.tar.gz 
        tar xvf run_drc.tar 
        \rm run drc.tar 
        gunzip run_lvs.tar.gz 
        tar xvf run_lvs.tar 
        \rm run_lvs.tar 
        gunzip run_ant.tar.gz 
        tar xvf run_ant.tar 
        \rm run_ant.tar 
        mv report/*.rpt . 
        mv report/cell_list . 
        mv report/info.txt .
