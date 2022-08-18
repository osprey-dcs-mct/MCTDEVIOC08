TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = MCTDEVIOC08
# MCTDEVIOC08.dbd will be created and installed
DBD += MCTDEVIOC08.dbd

# MCTDEVIOC08.dbd will be made up from these files:
MCTDEVIOC08_DBD += base.dbd

# Include dbd files from all support applications:
MCTDEVIOC08_DBD += asSupport.dbd
MCTDEVIOC08_DBD += calcSupport.dbd

# Add all the support libraries needed by this IOC
MCTDEVIOC08_LIBS += autosave
MCTDEVIOC08_LIBS += calc

# MCTDEVIOC08_registerRecordDeviceDriver.cpp derives from MCTDEVIOC08.dbd
MCTDEVIOC08_SRCS += MCTDEVIOC08_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
MCTDEVIOC08_SRCS_DEFAULT += MCTDEVIOC08Main.cpp
MCTDEVIOC08_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#MCTDEVIOC08_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
MCTDEVIOC08_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

