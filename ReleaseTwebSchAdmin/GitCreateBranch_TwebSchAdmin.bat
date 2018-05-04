SET oldbranch=v.5.40.50
SET newBranch=v.5.40.60

SET folders=ApplicationsForSchoolAdmin ^
AdminAttendance ^
IncidentTracking ^
ElementaryAchieveSetup ^
SecondaryAchievementSetup ^
StaffMaintenance ^
StudentMaintenance

REM modify pom-ver of 
cd ApplicationsForSchoolAdmin

REM Modify parent version
..\..\searchReplace.py pom-ver.xml "<version>2018.04.00-SNAPSHOT</version>" "<version>2018.07.00-SNAPSHOT</version>"

REM App version
..\..\searchReplace.py pom-ver.xml "<app.version.major.number>5.40.50</app.version.major.number>" "<app.version.major.number>5.40.60</app.version.major.number>"

REM Service version
..\..\searchReplace.py pom-ver.xml "<service.version>2018.04.00</service.version>" "<service.version>2018.07.00</service.version>"

git add pom-ver.xml
cd ..

FOR %%i IN (%folders%) DO (
    cd %%i
    git checkout %oldbranch%
    git checkout -b %newBranch% %oldbranch%
    
    REM Parent Version
    ..\..\searchReplace.py pom.xml <version>5.40.50-SNAPSHOT</version>" "<version>5.40.60-SNAPSHOT</version>"

    git add pom.xml
    git commit -m "Create the branch for July release of 2018"
    git push origin %newBranch%

    cd ..
)
    
    
    