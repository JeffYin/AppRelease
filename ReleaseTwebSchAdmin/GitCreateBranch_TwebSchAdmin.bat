SET baseFrameVersion=2021.03.00
SET newFrameVersion=2021.05.00
set ticketNumber=TRILL-10123

SET oldAppVersion=5.43.30
SET newAppVersion=5.43.40

SET oldAppBranch=v.%oldAppVersion%
SET newAppBranch=v.%newAppVersion%

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
..\..\searchReplace.py pom-ver.xml "<version>%baseFrameVersion%-SNAPSHOT</version>"  "<version>%newFrameVersion%-SNAPSHOT</version>"

REM App version
..\..\searchReplace.py pom-ver.xml "<app.version.major.number>%oldAppVersion%</app.version.major.number>" "<app.version.major.number>%newAppVersion%</app.version.major.number>"

REM Service version
..\..\searchReplace.py pom-ver.xml "<service.version>%baseFrameVersion%</service.version>" "<service.version>%newFrameVersion%</service.version>" 

git add pom-ver.xml
cd ..

FOR %%i IN (%folders%) DO (
    cd %%i
    REM git checkout %oldAppbranch%
    git checkout -b %newAppBranch% %oldAppBranch%
    
    REM Parent Version
    python ..\..\searchReplace.py pom.xml "<version>%oldAppVersion%-SNAPSHOT</version>" "<version>%newAppVersion%-SNAPSHOT</version>" 

    git add pom.xml
    git commit -m "%ticketNumber% Create build for TWebSchAdmin %newAppBranch%"
    git push --set-upstream origin %newAppBranch%

    cd ..
)
    
    
    