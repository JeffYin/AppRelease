SET branchName=v.5.41.00
SET newName=v.5.41.10

SET folders=ApplicationsForSchoolAdmin ^
AdminAttendance ^
IncidentTracking ^
ElementaryAchieveSetup ^
SecondaryAchievementSetup ^
StaffMaintenance ^
StudentMaintenance

FOR %%i IN (%folders%) DO (
    cd %%i
    
    git checkout %branchName%
    git branch -D %newName%
    git push origin --delete  %newName%
    cd ..
)
    
    
    