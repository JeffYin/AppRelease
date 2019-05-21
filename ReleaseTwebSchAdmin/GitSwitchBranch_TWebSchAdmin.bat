SET branchSour=v.5.41.20

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

    git pull

    cd ..
)