TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#----------------------------------------------------
# Create and install (or just install) into <top>/db
# databases, templates, substitutions like this
DB += MCT_global_info.db
DB += MCTSLT_status.db
DB += MCTSLT_stop.db
DB += MCTSLT01_target.db
DB += MCTSLT02_target.db
DB += MCTSLT03_target.db
DB += MCTSLT01_acceptance.db

#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_template = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

