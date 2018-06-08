SET branchSour=v.5.40.60

SET folders=ApplicationsForSchoolAdmin ^
AdminAttendance ^
IncidentTracking ^
ElementaryAchieveSetup ^
SecondaryAchievementSetup ^
StaffMaintenance ^
StudentMaintenance

FOR %%i IN (%folders%) DO (
    cd %%i
   
    REM Synchronize to the remote source branch
    git checkout %branchSour%

    cd ..
)