#!../../bin/linux-x86_64/MCTDEVIOC08

#- You may have to change MCTDEVIOC08 to something else
#- everywhere it appears in this file

< envPaths

epicsEnvSet("SLIT1", "MCTSLT01:")
epicsEnvSet("SLT01Z", "8000")
epicsEnvSet("SLIT2", "MCTSLT02:")
epicsEnvSet("SLT02Z", "15500")
epicsEnvSet("SLIT3", "MCTSLT03:")
epicsEnvSet("SLT03Z", "17000")
epicsEnvSet("VBMZ", "16091")
epicsEnvSet("IOCNAME", "MCTDEVIOC08")

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
dbLoadRecords("db/MCT_global_info.db")

# SLT01 records
dbLoadRecords("db/MCTSLT01_x_gap_status.db", "P=$(SLIT1)")
dbLoadRecords("db/MCTSLT01_x_centre_status.db", "P=$(SLIT1)")
dbLoadRecords("db/MCTSLT01_y_gap_status.db", "P=$(SLIT1),SLT01Z=$(SLT01Z),VBMZ=$(VBMZ)")
dbLoadRecords("db/MCTSLT01_y_centre_status.db", "P=$(SLIT1)")
dbLoadRecords("db/MCTSLT01_overall_status.db", "P=$(SLIT1)")
dbLoadRecords("db/MCTSLT01_target.db", "P=$(SLIT1)")

# SLT02 records
dbLoadRecords("db/MCTSLT02_x_gap_status.db", "P=$(SLIT2),SLT02Z=$(SLT02Z)")
dbLoadRecords("db/MCTSLT02_x_centre_status.db", "P=$(SLIT2)")
dbLoadRecords("db/MCTSLT02_y_gap_status.db", "P=$(SLIT2),SLT02Z=$(SLT02Z),VBMZ=$(VBMZ)")
dbLoadRecords("db/MCTSLT02_y_centre_status.db", "P=$(SLIT2)")
dbLoadRecords("db/MCTSLT02_overall_status.db", "P=$(SLIT2)")

# SLT03 records
dbLoadRecords("db/MCTSLT03_x_gap_status.db", "P=$(SLIT3),SLT02Z=$(SLT02Z),SLT03Z=$(SLT03Z)")
dbLoadRecords("db/MCTSLT03_x_centre_status.db", "P=$(SLIT3)")
dbLoadRecords("db/MCTSLT03_y_gap_status.db", "P=$(SLIT3),SLT02Z=$(SLT02Z),SLT03Z=$(SLT03Z),VBMZ=$(VBMZ)")
dbLoadRecords("db/MCTSLT03_y_centre_status.db", "P=$(SLIT3),SLT02Z=$(SLT02Z),SLT03Z=$(SLT03Z),VBMZ=$(VBMZ)")
dbLoadRecords("db/MCTSLT03_overall_status.db", "P=$(SLIT3)")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Autosave monitor set-up.
#
makeAutosaveFiles()
create_monitor_set("info_positions.req", 5, "")
create_monitor_set("info_settings.req", 15, "")
