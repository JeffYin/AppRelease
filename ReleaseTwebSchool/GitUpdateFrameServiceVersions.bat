SET workbranch=master

SET folders=ApplicationsForSchool ^
Attendance ^
ContinueEd ^
SecondaryAchievement ^
STA 

REM modify pom-ver of 
cd ApplicationsForSchool

REM Modify parent version
..\..\searchReplace.py pom-ver.xml "<version>2018.04.00-SNAPSHOT</version>" "<version>2018.07.00-SNAPSHOT</version>"

REM App version
..\..\searchReplace.py pom-ver.xml "<app.version.major.number>5.41.00</app.version.major.number>" "<app.version.major.number>5.41.10</app.version.major.number>"

REM Service version
..\..\searchReplace.py pom-ver.xml "<service.version>2018.04.00</service.version>" "<service.version>2018.07.00</service.version>"

git add pom-ver.xml
cd ..

FOR %%i IN (%folders%) DO (
    cd %%i
    git checkout %workbranch%
    
    REM Parent Version
    ..\..\searchReplace.py pom.xml "<version>5.41.00-SNAPSHOT</version>" "<version>5.41.10-SNAPSHOT</version>"

    git add pom.xml
    git commit -m "Create the branch for July release of 2018"
    git push origin %workbranch%

    cd ..
)

    
    
    