#!/usr/bin/python2.7
import sys
import os
import stat
import subprocess
import multiprocessing
import argparse
import pprint
import pandas as pd

#Global settings for script locations and PDKs
PDK_DB = "/mnt/researchdata/scripts/virtuoso_setup/pdks.csv"

#Helper Functions
def add_alter_pdk(args):
    pdk_script = os.path.abspath(args.pdk_script)
    if os.path.isfile(PDK_DB):
        df = pd.read_csv(PDK_DB, index_col=0)
        #If index already exists, update
        ud = create_df_row(args.pdk, args.virt_version, pdk_script,
                args.pdk_description)
        if args.pdk in df.index:
            df.update(ud)
        else:
            df = df.append(ud)
        df.to_csv(PDK_DB)
    else:
        print('PDK database not found. Exiting...')
        sys.exit(2)

def remove_pdk_from_db(args):
    if os.path.isfile(PDK_DB):
        df = pd.read_csv(PDK_DB, index_col=0)
        if args.pdk in df.index:
            df = df.drop(args.pdk)
            df.to_csv(PDK_DB)
        else:
            print('PDK not in DB')
    else:
        print('PDK database not found. Exiting...')
        sys.exit(2)

def create_df_row(pdk, virt_version, pdk_script, pdk_description):
    df = pd.DataFrame(data=[[virt_version, pdk_script, pdk_description]],
                      index=[pdk],
                      columns=["VIRTUOSO_VERSION", "PDK_SCRIPT", "PDK_DESCRIPTION"])
    return df

def print_pdk_db():
    if os.path.isfile(PDK_DB):
        df = pd.read_csv(PDK_DB, index_col=0)
        for pdk in df.index:
            print_df_row(pdk, df.loc[pdk])
    else:
        print('PDK Database missing. Exiting...')
        sys.exit(2)

def print_df_row(pdk, df_row):
    print('PDK Name: %s (%s)' % (pdk, df_row.loc['PDK_DESCRIPTION']))
    print('\tVirtuoso Version: %s' % df_row.loc['VIRTUOSO_VERSION'])
    print('\tPDK Script: %s' % df_row.loc['PDK_SCRIPT'])

if __name__ == '__main__':
    #Create parser for the script
    parser = argparse.ArgumentParser(description='Add/Alter PDKs for use.')
    parser.add_argument('-p', action="store", dest="pdk",
                        required=False, help='PDK name to add/alter')
    parser.add_argument('-s', action="store", dest="pdk_script",
                        required=False, help='PDK setup script path')
    parser.add_argument('-d', action="store", dest="pdk_description",
                        required=False, help='PDK description')
    parser.add_argument('-v', action="store", dest="virt_version",
                        required=False, default="IC616",
                        help='Virtuoso Version to use for PDK (Default IC616)')
    parser.add_argument('-r', action="store_true", dest="remove_pdk",
                        required=False, default=False,
                        help='Remove PDK from database')
    parser.add_argument('-l', action="store_true", dest="print_pdks",
                        required=False, default=False,
                        help='List the PDKs in the database')
    args = parser.parse_args()
    if args.print_pdks:
        print_pdk_db()
    else:
        if not args.pdk:
            print('(-p) PDK name required')
            sys.exit(2)
        if args.remove_pdk:
            remove_pdk_from_db(args)
        else:
            if not (args.pdk_script or args.pdk_description):
                print('(-s) PDK setup script and (-d) PDK description required')
                sys.exit(2)
            add_alter_pdk(args)
