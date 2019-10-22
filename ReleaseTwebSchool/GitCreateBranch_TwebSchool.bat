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
REM ..\..\searchReplace.py pom-ver.xml "<version>2018.11.00-SNAPSHOT</version>" "<version>2019.02.00-SNAPSHOT</version>"

REM App version
REM python ..\..\searchReplace.py pom-ver.xml "<app.version.major.number>5.42.00</app.version.major.number>" "<app.version.major.number>5.42.00</app.version.major.number>"
python ..\..\searchReplace.py pom-ver.xml "<app.version.minor.number></app.version.minor.number>" "<app.version.minor.number>.01</app.version.minor.number>" 
REM Service version
REM ..\..\searchReplace.py pom-ver.xml "<service.version>2018.11.00</service.version>" "<service.version>2019.02.00</service.version>"

git add pom-ver.xml
cd ..

FOR %%i IN (%folders%) DO (
    cd %%i
    git pull
    git checkout %oldbranch%
    
    REM Parent Version
    python ..\..\searchReplace.py pom.xml "<version>5.42.00-SNAPSHOT</version>" "<version>5.42.00.01-SNAPSHOT</version>"

    git add pom.xml
    git commit -m "TRILL-8799 Create the branch for the new report logo. "
    git push --set-upstream origin %newBranch%

    cd ..
)
    
    
    