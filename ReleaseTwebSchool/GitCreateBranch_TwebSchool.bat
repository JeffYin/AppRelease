SET oldbranch=master

REM Frame version is same between 5.43.30 & 5.43.40
SET baseFrameVersion=2021.03.00
SET newFrameVersion=2021.03.00
set ticketNumber=TRILL-9760

SET oldAppVersion=5.43.30
SET newAppVersion=5.43.40

SET folders=ApplicationsForSchool ^
Attendance ^
ContinueEd ^
SecondaryAchievement ^
STA ^
SecondaryAchievementReportCard

REM modify pom-ver of 
cd ApplicationsForSchool
git checkout %oldbranch%
git pull

REM Modify parent version
..\..\searchReplace.py pom-ver.xml  "<version>%baseFrameVersion%-SNAPSHOT</version>"  "<version>%newFrameVersion%-SNAPSHOT</version>"

REM App version
python ..\..\searchReplace.py pom-ver.xml "<app.version.major.number>%oldAppVersion%</app.version.major.number>" "<app.version.major.number>%newAppVersion%</app.version.major.number>"
REM python ..\..\searchReplace.py pom-ver.xml "<app.version.minor.number></app.version.minor.number>" "<app.version.minor.number></app.version.minor.number>" 
REM Service version
..\..\searchReplace.py pom-ver.xml "<service.version>%baseFrameVersion%</service.version>" "<service.version>%newFrameVersion%</service.version>"

git add pom-ver.xml
cd ..

FOR %%i IN (%folders%) DO (
    cd %%i
    git pull
    git checkout %oldbranch%
    
    REM Parent Version
    python ..\..\searchReplace.py pom.xml "<version>%oldAppVersion%-SNAPSHOT</version>" "<version>%newAppVersion%-SNAPSHOT</version>"

    git add pom.xml
    git commit -m "%ticketNumber% Create build for TWebSchool %newAppVersion%"
    git push 

    cd ..
)
    
    
    