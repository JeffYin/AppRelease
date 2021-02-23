
SET folders=ApplicationsForSchoolAdmin ^
AdminAttendance ^
IncidentTracking ^
ElementaryAchieveSetup ^
SecondaryAchievementSetup ^
StaffMaintenance ^
StudentMaintenance

FOR %%i IN (%folders%) DO (
    call git clone git@gitlab.powerschool.com:SRB-Trillium/eTrillium_%%i.git %%i
)
    