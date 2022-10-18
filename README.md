# MCTDEVIOC08

## Summary

IOC for calculating slit target positions and slit positions status.

## Details

### Slit targets

Each slit axis target position is calculated for all four beamline operating
modes based on the position of the relevant upstream components. The relevant
mode is then selected based on the monochromator and mirror status, and the
appropriate setpoints sent to the slit coordinate system motor records.

### Movement control

Each slit assembly can be set to Auto or Manual control. In Auto, the slit
positions will change as soon as the upstream component position setpoints
change. In Manual, the user must request the slits to move to the required
positions.

The `ALL_MOVE` command sequences the gap and centre movements for the
horizontal and vertical axes so that there are not movements requests queued up
in the motor records.

## UI

//ASP/opa/mct/opis/ui/PDS/MCTSLT_eng.ui



