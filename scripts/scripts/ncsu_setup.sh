#!/bin/sh
#################################################################################
#										                                        #
#	Script to configure the NCSU 45 nm  PDK 				                    #
#	01/24/2014	Version 1.0						                                #
#	03/06/2014	Version 2.0 Added icoa_setup.sh script from Ying Teng 	        #
#	02/25/2015      Version 3.0 Changed PWD to VIRTUOSO_WORK_DIR  		        #
#               to work with new configuartion script. Moved CDS to             #
#               configuration script to work with multiple IC Versions. Added   # 
#               check to see if .cdsinit & .cdsenv source files are newer   	#
#	Divya Pathak <divya.pathak@drexel.edu>					                    #
#										                                        #
################################################################################# 

export PDK_DIR=/mnt/class_data/ecec571-f2015/PDKs/NCSU_FreePDK45
export NANGATE=/mnt/class_data/ecec571-f2015/PDKs/NangateOpenCellLibrary_PDKv1_3_v2010_12
export PDK_SETUP_FILES=/mnt/class_data/ecec571-f2015/scripts/virtuoso_setup/pdk_setup/NANGATE_45

if [ -n $LD_LIBRARY_PATH ]
then
    export LD_LIBRARY_PATH=$PDK_DIR/ncsu_basekit:${LD_LIBRARY_PATH}
else
    export LD_LIBRARY_PATH=$PDK_DIR/ncsu_basekit
fi

if [ ! -f ${VIRTUOSO_WORK_DIR}/.cdsinit  ] || [ ${PDK_SETUP_FILES}/.cdsinit -nt ${VIRTUOSO_WORK_DIR}/.cdsinit ]; then
  cp ${PDK_SETUP_FILES}/.cdsinit ${VIRTUOSO_WORK_DIR}/.cdsinit
fi

if [ ! -f ${VIRTUOSO_WORK_DIR}/.cdsenv  ] || [ ${PDK_SETUP_FILES}/.cdsenv -nt ${VIRTUOSO_WORK_DIR}/.cdsenv ]; then
  cp ${PDK_SETUP_FILES}/.cdsenv ${VIRTUOSO_WORK_DIR}/.cdsenv
fi

if [ ! -f ${VIRTUOSO_WORK_DIR}/cds.lib  ]; then
  cp ${PDK_DIR}/ncsu_basekit/cdssetup/cds.lib ${VIRTUOSO_WORK_DIR}/cds.lib
fi

if [ ! -f ${VIRTUOSO_WORK_DIR}/lib.defs  ]; then
  cp ${PDK_DIR}/ncsu_basekit/cdssetup/lib.defs ${VIRTUOSO_WORK_DIR}/lib.defs
fi

if [ ! -f ${VIRTUOSO_WORK_DIR}/.runset.calibre.drc  ]; then
  cp ${PDK_DIR}/ncsu_basekit/cdssetup/runset.calibre.drc ${VIRTUOSO_WORK_DIR}/.runset.calibre.drc
fi

if [ ! -f ${VIRTUOSO_WORK_DIR}/.runset.calibre.lvs  ]; then
  cp ${PDK_DIR}/ncsu_basekit/cdssetup/runset.calibre.lvs ${VIRTUOSO_WORK_DIR}/.runset.calibre.lvs
fi

if [ ! -f ${VIRTUOSO_WORK_DIR}/.runset.calibre.lfd  ]; then
  cp ${PDK_DIR}/ncsu_basekit/cdssetup/runset.calibre.lfd ${VIRTUOSO_WORK_DIR}/.runset.calibre.lfd
fi

if [ ! -f ${VIRTUOSO_WORK_DIR}/.runset.calibre.pex  ]; then
  cp ${PDK_DIR}/ncsu_basekit/cdssetup/runset.calibre.pex ${VIRTUOSO_WORK_DIR}/.runset.calibre.pex
fi
present=`printenv PYTHONPATH`
if [ "$present" == "" ]; then
  export PYTHONPATH=$PDK_DIR'/ncsu_basekit/techfile/cni'
else
  export PYTHONPATH=$PYTHONPATH':'$PDK_DIR'/ncsu_basekit/techfile/cni'
fi

export MGC_CALIBRE_DRC_RUNSET_FILE=$VIRTUOSO_WORK_DIR/.runset.calibre.drc
export MGC_CALIBRE_LVS_RUNSET_FILE=$VIRTUOSO_WORK_DIR/.runset.calibre.lvs
export MGC_CALIBRE_PEX_RUNSET_FILE=$VIRTUOSO_WORK_DIR/.runset.calibre.pex
### NOT IMPLEMENTED ON savrsch YET ###
#source /home/ECEx72/icoa_setup.sh
