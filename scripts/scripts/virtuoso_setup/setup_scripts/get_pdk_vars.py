#!/usr/bin/python2.7
import sys
import os
import getpass
import pickle

#Global settings for script locations and PDKs
USER_CONFIG = os.path.expanduser("~/.cadence_config")
PDK_DB = "/mnt/researchdata/scripts/virtuoso_setup/pdks.csv"

#Helper Functions
if __name__ == '__main__':
    #Load shared tmp file
    tmp_file = "/tmp/tmp_%s.pkl" % getpass.getuser()
    fp = open(tmp_file)
    shared = pickle.load(fp)
    fp.close()
    
    if not shared['has_error']:
        #Make sure run directory exists 
        print('{env}VIRT_VERSION=%s VIRTUOSO_WORK_DIR=%s MMSIM_VERSION=%s ASSURA_VERSION=%s' % 
                (shared['virt_version'], shared['run_dir'],
                shared['mmsim_version'], shared['assura_version']))
        print('{pdk_script}%s' % (shared['pdk_script']))
    
    os.system("rm %s" % (tmp_file))
