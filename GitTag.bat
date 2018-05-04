SET branchName=master
SET tagName=tag.5.40.20
REM SET folders=ApplicationsForSchoolAdmin AdminAttendance IncidentTracking ElementaryAchieveSetup SecondaryAchievementSetup StaffMaintenance StudentMaintenance
SET folders=ApplicationsForSchool STA SecondaryAchievement Attendance ContinueEd 
FOR %%i IN (%folders%) DO (
    cd %%i
    
    REM remove the old abmious tag name. 
    REM git tag -d v.5.40.45
    REM git push origin :ref/tags/v.5.40.45

    git checkout %branchName%
    git reset --hard origin/%branchName%
    
    REM REM Create Tag: %tagName%.    
    git tag %tagName%
    git push origin %tagName%

    cd ..
)
    
    
    