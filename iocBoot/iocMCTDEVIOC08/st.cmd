#!../../bin/linux-x86_64/MCTDEVIOC08

#- You may have to change MCTDEVIOC08 to something else
#- everywhere it appears in this file

< envPaths

epicsEnvSet("SLIT1", "MCTSLT01")
epicsEnvSet("SLIT1DESC", "SLT A")
epicsEnvSet("SLT01Z", "8000")
epicsEnvSet("SLIT2", "MCTSLT02")
epicsEnvSet("SLIT2DESC", "SLT B")
epicsEnvSet("SLT02Z", "15500")
epicsEnvSet("SLIT3", "MCTSLT03")
epicsEnvSet("SLIT3DESC", "SLT C")
epicsEnvSet("SLT03Z", "17000")
epicsEnvSet("VBMZ", "16091")
epicsEnvSet("IOCNAME", "MCTDEVIOC08")
epicsEnvSet("AS_PATH", "/asp/autosave/$(IOCNAME)")

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/MCTDEVIOC08.dbd"
MCTDEVIOC08_registerRecordDeviceDriver pdbbase

## Autosave set-up
#
< ${AUTOSAVESETUP}/crapi/save_restore.cmd

## Restore auto save like this ....
set_pass0_restoreFile("info_settings.sav")
set_pass1_restoreFile("info_settings.sav")
set_pass0_restoreFile("info_positions.sav")

## Load record instances

#Global MCT info (Beam mode, Z locations, etc)
dbLoadRecords("db/MCT_global_info.db", "PREC=3")

# SLT01 records
dbLoadRecords("db/MCTSLT_status.db", "P=$(SLIT1):,SLIT=$(SLIT1),DESC=$(SLIT1DESC)")
dbLoadRecords("db/MCTSLT_stop.db", "P=$(SLIT1):,SLIT=$(SLIT1),DESC=$(SLIT1DESC)")
dbLoadRecords("db/MCTSLT01_target.db", "P=$(SLIT1):,PREC=3")
dbLoadRecords("db/MCTSLT01_acceptance.db", "P=$(SLIT1):")

# SLT02 records
dbLoadRecords("db/MCTSLT_status.db", "P=$(SLIT2):,SLIT=$(SLIT2),DESC=$(SLIT2DESC)")
dbLoadRecords("db/MCTSLT_stop.db", "P=$(SLIT2):,SLIT=$(SLIT2),DESC=$(SLIT2DESC)")
dbLoadRecords("db/MCTSLT02_target.db", "P=$(SLIT2):,PREC=3")

# SLT03 records
dbLoadRecords("db/MCTSLT_status.db", "P=$(SLIT3):,SLIT=$(SLIT3),DESC=$(SLIT3DESC)")
dbLoadRecords("db/MCTSLT_stop.db", "P=$(SLIT3):,SLIT=$(SLIT3),DESC=$(SLIT3DESC)")
dbLoadRecords("db/MCTSLT03_target.db", "P=$(SLIT3):,PREC=3")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Autosave monitor set-up.
#
cd ${AS_PATH}
makeAutosaveFiles()

set_requestfile_path("${AS_PATH}")
create_monitor_set("info_positions.req", 5, "")
create_monitor_set("info_settings.req", 15, "")

cd "${TOP}/iocBoot/${IOC}"
