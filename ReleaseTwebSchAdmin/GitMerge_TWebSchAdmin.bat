SET branchSour=v.5.43.10
SET branchDest=master

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
    git reset --hard origin/%branchSour%
    git pull

    REM Synchronize to the remote Dest branch
    git checkout %branchDest%
    git reset --hard origin/%branchDest%

    git merge --no-ff %branchSour%
    
    REM ADD all changes
    git add -A 
    
    git commit -m "Merged from %branchSour% to %branchDest%. "
    git push origin %branchDest%
    cd ..
)