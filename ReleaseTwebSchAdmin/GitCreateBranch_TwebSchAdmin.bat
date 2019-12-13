SET oldbranch=v.5.42.20
SET newBranch=v.5.42.20

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
..\..\searchReplace.py pom-ver.xml "<version>2019.09.00-SNAPSHOT</version>" "<version>2020.01.00-SNAPSHOT</version>"

REM App version
REM ..\..\searchReplace.py pom-ver.xml "<app.version.major.number>5.42.10</app.version.major.number>" "<app.version.major.number>5.42.20</app.version.major.number>"

REM Service version
..\..\searchReplace.py pom-ver.xml "<service.version>2019.09.00</service.version>" "<service.version>2020.01.00</service.version>"

git add pom-ver.xml
cd ..

FOR %%i IN (%folders%) DO (
    cd %%i
    git checkout %oldbranch%
    REM git checkout -b %newBranch% %oldbranch%
    
    REM Parent Version
    REM python ..\..\searchReplace.py pom.xml "<version>5.42.10-SNAPSHOT</version>" "<version>5.42.20-SNAPSHOT</version>"

    git add pom.xml
    git commit -m "TRILL-9012 Updated the Frame/Services to 2020.01.00"
    git push --set-upstream origin %newBranch%

    cd ..
)
    
    
    