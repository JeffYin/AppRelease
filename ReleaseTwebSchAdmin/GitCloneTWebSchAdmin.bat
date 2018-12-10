
SET folders=ApplicationsForSchoolAdmin ^
AdminAttendance ^
IncidentTracking ^
ElementaryAchieveSetup ^
SecondaryAchievementSetup ^
StaffMaintenance ^
StudentMaintenance

FOR %%i IN (%folders%) DO (
    call git clone git@gitswarm.powerschool.com:SRB-Trillium/eTrillium_%%i.git %%i
)
    