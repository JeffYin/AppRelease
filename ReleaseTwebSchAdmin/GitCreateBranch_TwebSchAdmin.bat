SET oldbranch=v.5.41.20
SET newBranch=v.5.42.00

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
..\..\searchReplace.py pom-ver.xml "<version>2019.04.00-SNAPSHOT</version>" "<version>2019.07.00-SNAPSHOT</version>"

REM App version
..\..\searchReplace.py pom-ver.xml "<app.version.major.number>5.41.20</app.version.major.number>" "<app.version.major.number>5.42.00</app.version.major.number>"

REM Service version
..\..\searchReplace.py pom-ver.xml "<service.version>2019.04.00</service.version>" "<service.version>2019.07.00</service.version>"

git add pom-ver.xml
cd ..

FOR %%i IN (%folders%) DO (
    cd %%i
    git checkout %oldbranch%
    git checkout -b %newBranch% %oldbranch%
    
    REM Parent Version
    python ..\..\searchReplace.py pom.xml "<version>5.41.20-SNAPSHOT</version>" "<version>5.42.00-SNAPSHOT</version>"

    git add pom.xml
    git commit -m "TRILL-7647 Create the branch for 2019.07 release."
    git push --set-upstream origin %newBranch%

    cd ..
)
    
    
    