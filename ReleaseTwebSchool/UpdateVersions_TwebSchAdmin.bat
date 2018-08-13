SET oldbranch=v.5.40.50
SET newBranch=v.5.40.60

SET folders=ApplicationsForSchoolAdmin AdminAttendance IncidentTracking ElementaryAchieveSetup SecondaryAchievementSetup StaffMaintenance StudentMaintenance

FOR %%i IN (%folders%) DO (
    cd %%i
    REM Parent Version
    REM ..\..\searchReplace.py pom.xml <version>5.40.60-SNAPSHOT</version>" <version>5.40.60-SNAPSHOT</version>

    git add pom.xml
    git commit -m "Create the branch for July release of 2018"
    git push origin %newBranch%

    cd ..
)
    
    
    