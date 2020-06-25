SET oldbranch=master

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
..\..\searchReplace.py pom-ver.xml  "<version>2020.01.00-SNAPSHOT</version>"  "<version>2020.08.00-SNAPSHOT</version>"

REM App version
python ..\..\searchReplace.py pom-ver.xml "<app.version.major.number>5.43.10</app.version.major.number>" "<app.version.major.number>5.43.20</app.version.major.number>"
REM python ..\..\searchReplace.py pom-ver.xml "<app.version.minor.number></app.version.minor.number>" "<app.version.minor.number></app.version.minor.number>" 
REM Service version
..\..\searchReplace.py pom-ver.xml "<service.version>2020.01.00</service.version>" "<service.version>2020.08.00</service.version>"

git add pom-ver.xml
cd ..

FOR %%i IN (%folders%) DO (
    cd %%i
    git pull
    git checkout %oldbranch%
    
    REM Parent Version
    python ..\..\searchReplace.py pom.xml "<version>5.43.10-SNAPSHOT</version>" "<version>5.43.20-SNAPSHOT</version>"

    git add pom.xml
    git commit -m "TRILL-9485 Create build for TWebSchool 5.43.20"
    git push 

    cd ..
)
    
    
    