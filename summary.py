import sys, os, re, string, getopt, fileinput, re 

def parseDRC(filename): 
    #pattern = re.compile(r"RULECHECK\s+.+\s+TOTAL\s+Result\s+Count\s+=\s+\d*(\d*)", re.VERBOSE)
    pattern = re.compile(r"RULECHECK\s*.+\s*TOTAL\s+Result\s+Count\s*=\s*\d*[(]*\d*[(]*\d*[)]*", re.VERBOSE) 
    pattern2 = re.compile(r"RULECHECK\s+.+\s+NOT\s+EXECUTED", re.VERBOSE) 
    rulecheck = [] 
    for line in fileinput.input(filename):
        match = pattern.search(line(:-1]) 
        match2 = pattern2.search(line[:-l]) 
        if match: 
            s = line.split()
            if s[7] != '0':
                try: 
                    rulecheck.append([s(l], s[7], s[8}]) 
                except: 
                    rulecheck.append;(s[I], s[7], "-1"]) 
        elif match2: 
            s = line.split() 
            rulecheck.append([s[l], "-1", "-!"]) 
    return rulecheck

def parseDRCDBffilename, comment):
    pattern = re.compiler(r"\s*{.*@\s*", re.VERBOSE)
    for line in fileinput.input(filename): 
        match = pattern.search(line[:-l]) 
        if match: 
            s = pattern.split(line[:-l]) 
            if s[0] not in comment.keys():
                comment[s[0]] = s[1] 
    return comment 

def outputDRC(celllist): 
    cell list = [] 
    rulecheck = {}
    comment = {}
    for cell in fileinput.input(celllist): 
        cell_list.append(cell[:-1) 
    for cell in cell_list: 
        reportpath = "run_drc/" + cell + "/" 
        os.chdir(reportpath) 
        reportname = cell + ".rep" 
        dbname = cell + ".db" 
        #print "Scanning ...", reportpath + reportname 
        rulecheck[cell] = parseDRC(reportname) 
        comment = parseDRCDB(dbname, comment) 
        os.chdir("../..") 
    rule = {} 
    for cell in cell_list:
        #print "CELL", cell 
        for r in rulecheck[cell]: 
            if r[0] in rule.keys():
                rule[r[O]].append(cell) 
            else: 
                rule(r[0]) = [cell] 
            #print "RULECHECK", r(0], " = ", r[1], r[2], comment[r[0]] 
        #print "-----------------------------" 
    #print "======================================================"
    for r in rule.keys(): 
        print "RULECHSCK %-16s %6s" % (r, len(rule[r])) 
        for cell in rule[r]:
            print cell, 
        print
    print "======================================================"
    print "DRC Sumnary" 
    print "======================================================"
    i = 0 
    for r in rule.keys():
        summary = (r, len(rule[r]), comment[r]) 
        print "RULECHECK %-16s %6s %s" % summary 
        i = i + 1
