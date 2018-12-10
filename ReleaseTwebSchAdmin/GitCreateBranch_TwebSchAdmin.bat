SET oldbranch=v.5.41.00
SET newBranch=v.5.41.10

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
..\..\searchReplace.py pom-ver.xml "<version>2018.11.00-SNAPSHOT</version>" "<version>2019.02.00-SNAPSHOT</version>"

REM App version
..\..\searchReplace.py pom-ver.xml "<app.version.major.number>5.41.00</app.version.major.number>" "<app.version.major.number>5.41.10</app.version.major.number>"

REM Service version
..\..\searchReplace.py pom-ver.xml "<service.version>2018.11.00</service.version>" "<service.version>2019.02.00</service.version>"

git add pom-ver.xml
cd ..

FOR %%i IN (%folders%) DO (
    cd %%i
    git checkout %oldbranch%
    git checkout -b %newBranch% %oldbranch%
    
    REM Parent Version
    python ..\..\searchReplace.py pom.xml "<version>5.41.00-SNAPSHOT</version>" "<version>5.41.10-SNAPSHOT</version>"

    git add pom.xml
    git commit -m "TRILL-6319 Create the branch for 2019.02 release."
    git push --set-upstream origin %newBranch%

    cd ..
)
    
    
    