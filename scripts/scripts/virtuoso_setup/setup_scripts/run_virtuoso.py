#!/usr/bin/python2.7
import sys
import os
import argparse
import pandas as pd
import re
import pickle
import getpass

#Global settings for script locations and PDKs
USER_CONFIG = os.path.expanduser("~/.cadence_config")
PDK_DB = "/mnt/researchdata/scripts/virtuoso_setup/pdks.csv"

def dump_tmp():
    tmp_file = "/tmp/tmp_%s.pkl" % getpass.getuser()
    fp = open(tmp_file,"w")
    pickle.dump(SHARED, fp)
    fp.close()

#Global Shred VARS/Errors to pass to get_pdk_vars script
SHARED = {'has_error': True}
dump_tmp()

#Helper Functions
def make_dir(directory):
    if not os.path.exists(directory):
        os.makedirs(directory)

def check_run_dir(directory):
    if not os.path.isdir(directory):
        ur = raw_input(
             "Directory does not exist. Would you like to create it?[Y/N] ") 
        if((ur.lower() == "yes") or (ur.lower() == "y")):
            make_dir(directory)

    return check_home_dir(directory)

def get_script_defaults():
    if os.path.isfile(USER_CONFIG):
        df = pd.read_csv(USER_CONFIG, index_col=0)
        default_conditions = df.loc[df['DEFAULT'] == True]
        if default_conditions.empty == False:
            return(default_conditions.index[0],
                   default_conditions.at[default_conditions.index[0], 'RUN_DIR'])
        else:
            return 'NA', 'NA'
    else:
        print('Cadence Config File Does Not Exist. Requiring PDK and run directory arguments')
        return 'NA', 'NA'

def update_default_settings(args):
    ur = raw_input(
        "Would you like to create/update the default PDK/RUN_DIR settings?[Y/N] ") 
    if((ur.lower() == "yes") or (ur.lower() == "y")):
        run_dir = os.path.abspath(args.run_dir)
        default_df = create_df_row(args.pdk, run_dir, True)
        if os.path.isfile(USER_CONFIG):
            df = pd.read_csv(USER_CONFIG, index_col=0)
            default_conditions = df.loc[df['DEFAULT'] == True]
            if default_conditions.empty == False:
                #Check if current default is same PDK
                if default_conditions.index[0] == args.pdk:
                    df.update(default_df)
                else:
                    df.loc[default_conditions.index[0], 'DEFAULT'] = False
                    if args.pdk in df.index:
                        df.update(default_df)
                    else:
                        df = df.append(default_df)
                df.to_csv(USER_CONFIG)
        else:
            default_df.to_csv(USER_CONFIG)

def save_pdk_settings(args):
    run_dir = os.path.abspath(args.run_dir)
    if os.path.isfile(USER_CONFIG):
        df = pd.read_csv(USER_CONFIG, index_col=0)
        #If index already exists, update
        ud = create_df_row(args.pdk, run_dir, False)
        if args.pdk in df.index:
            df.update(ud)
        else:
            df = df.append(ud)
        df.to_csv(USER_CONFIG)
    else:
        default_df.to_csv(USER_CONFIG)

def create_df_row(pdk, run_dir, isDefault):
    df = pd.DataFrame(data=[[run_dir, isDefault]],
                      index=[pdk],
                      columns=["RUN_DIR", "DEFAULT"])
    return df

def check_pdk(pdk):
    if os.path.isfile(PDK_DB):
        df = pd.read_csv(PDK_DB, index_col=0)
        valid_pdks = []
        for idx in df.index:
            if idx == pdk:
                return df.at[idx, 'VIRTUOSO_VERSION'], df.at[idx, 'PDK_SCRIPT']
            valid_pdks.append(idx)

        print('Invalid PDK. Valid PDK options listed below')
        print valid_pdks
        dump_and_exit(2)
    else:
        print('PDK Database missing. Exiting...')
        dump_and_exit(2)

def check_virt_version(virt_version):
    virt_dir = "/opt/cadence/" + virt_version 
    if not os.path.isdir(virt_dir):
        print('Invalid Virtuoso Version. %s does not exist' % (virt_dir))
        dump_and_exit(2)

def get_run_dir(pdk):
    if os.path.isfile(USER_CONFIG):
        df = pd.read_csv(USER_CONFIG, index_col=0)
        if pdk in df.index:
            return df.at[pdk, 'RUN_DIR']
        else:
            return 'NA'
    else:
        return 'NA'

#Check that run directory is not on the /home parition
#Returns boolean to continue/Not-continue
def check_home_dir(directory):
    if not os.path.isdir(directory):
        print('Run directory is not a directory. Exiting.')
        dump_and_exit(2)

    home_check = re.search(r'.*\/home\/.*', os.path.expanduser(directory))
    if home_check:
        ur = raw_input('Run directory is in home. PLEASE RUN IN /mnt/localresearchdata. Are you sure you want to run in home?[Y/N] ')
        if((ur.lower() == "yes") or (ur.lower() == "y")):
            return True
        else:
            return False
    else:
        return True

def dump_and_exit(error_code):
    #Pass shared variables
    SHARED['has_error'] = True
    tmp_file = "/tmp/tmp_%s.pkl" % getpass.getuser()
    fp = open(tmp_file,"w")
    pickle.dump(SHARED, fp)
    fp.close()
    #Exit
    sys.exit(error_code)

def get_versions(args):
    cad_dir = os.listdir('/opt/cadence')
    av = check_prog_arg(args.assura_version, "ASSURA")
    mv = check_prog_arg(args.mmsim_version, "MMSIM")
    return check_version(av), check_version(mv)

def check_prog_arg(prog_arg, prog_name):
    prog_versions = []
    if not prog_arg:
        for elem in os.listdir('/opt/cadence/'):
            match = re.search(r'%s.*' % prog_name, elem)
            if match:
                prog_versions.append(match.group())
    else:
        prog_versions.append(prog_arg)

    return prog_versions

def check_version(prog):
    if len(prog) == 0:
        version = "NA"
    else:
        sp = sorted(prog, reverse=True)
        version = sp[0]

    return version

if __name__ == '__main__':
    #Get default options if available
    pdk, run_dir = get_script_defaults()  
    #Create parser for the script
    parser = argparse.ArgumentParser(description='Script to start Cadence Virtuoso.')
    parser.add_argument('-p', action="store", dest="pdk",
                        required=False, default=pdk, 
                        help='PDK to use')
    parser.add_argument('-r', action="store", dest="run_dir",
                        required=False, default=run_dir, 
                        help='Run directory for Virtuoso')
    parser.add_argument('-u', action="store_true", dest="update_default",
                        required=False, default=False, 
                        help='Update default settings with provided settings')
    parser.add_argument('-s', action="store_true", dest="save_pdk",
                        required=False, default=False, 
                        help='Save Non-Default PDK settings')
    parser.add_argument('-a', action="store_true", dest="assura_version",
                        required=False, help='Assura directory name to use')
    parser.add_argument('-m', action="store_true", dest="mmsim_version",
                        required=False, help='MMSIM directory name to use')
    
    args = parser.parse_args()
    if(pdk == 'NA' and args.pdk == 'NA'):
        print('PDK argument (-p) required')
        dump_and_exit(2)
    #Check PDK and get VIRT_VERSION
    virt_version, pdk_script = check_pdk(args.pdk)
    if((args.pdk != pdk) and (args.run_dir == run_dir)):
        args.run_dir = get_run_dir(args.pdk)
        if args.run_dir == 'NA':
            print('Please provide run directory for PDK (-r)')
            dump_and_exit(2)
    #If defaults don't exist or user requests default update
    if((pdk == 'NA') or (run_dir == 'NA') or args.update_default):
        update_default_settings(args)
    if(args.save_pdk):
        save_pdk_settings(args)
    #Make sure run directory exists 
    if check_run_dir(args.run_dir):
        check_virt_version(virt_version)
    else:
        print('Run directory invalid or in home directory.')
        print args.run_dir
        dump_and_exit(2)

    #Get Program Versions
    assura_version, mmsim_version = get_versions(args) 

    #Pass shared variables
    tmp_file = "/tmp/tmp_%s.pkl" % getpass.getuser()
    fp = open(tmp_file,"w")
    SHARED['run_dir'] = args.run_dir
    SHARED['virt_version'] = virt_version
    SHARED['pdk_script'] = pdk_script
    SHARED['mmsim_version'] = mmsim_version
    SHARED['assura_version'] = assura_version
    #If it gets this far set no error
    SHARED['has_error'] = False
    pickle.dump(SHARED, fp)
    fp.close()
