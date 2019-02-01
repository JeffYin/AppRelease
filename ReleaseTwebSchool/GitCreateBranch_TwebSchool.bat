SET oldbranch=tag.5.41.10
SET newBranch=v.5.41.10.01

SET folders=ApplicationsForSchool ^
Attendance ^
ContinueEd ^
SecondaryAchievement ^
STA ^
SecondaryAchievementReportCard

REM modify pom-ver of 
cd ApplicationsForSchool
git pull
 git checkout -b %newBranch% %oldbranch%

REM Modify parent version
REM ..\..\searchReplace.py pom-ver.xml "<version>2018.11.00-SNAPSHOT</version>" "<version>2019.02.00-SNAPSHOT</version>"

REM App version
REM ..\..\searchReplace.py pom-ver.xml "<app.version.major.number>5.41.00</app.version.major.number>" "<app.version.major.number>5.41.10</app.version.major.number>"
 ..\..\searchReplace.py pom-ver.xml "<app.version.minor.number></app.version.minor.number>" "<app.version.minor.number>.01</app.version.minor.number>" 
REM Service version
REM ..\..\searchReplace.py pom-ver.xml "<service.version>2018.11.00</service.version>" "<service.version>2019.02.00</service.version>"

git add pom-ver.xml
cd ..

FOR %%i IN (%folders%) DO (
    cd %%i
    git pull
    git checkout -b %newBranch% %oldbranch%
    
    REM Parent Version
    python ..\..\searchReplace.py pom.xml "<version>5.41.10-SNAPSHOT</version>" "<version>5.41.10.01-SNAPSHOT</version>"

    git add pom.xml
    git commit -m "TRILL-6084 Create the branch for Dufferin Peel."
    git push --set-upstream origin %newBranch%

    cd ..
)
    
    
    