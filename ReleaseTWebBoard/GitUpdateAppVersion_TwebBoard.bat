SET newBranch=master

SET folders=ApplicationsForBoard ^
BoardGrouping ^
EIS ^
ESL ^
GLW ^
IntegrationServices ^
Purge


REM modify pom-ver of 
cd ApplicationsForBoard

REM Modify parent version
..\..\searchReplace.py pom-ver.xml "<version>2019.04.01-SNAPSHOT</version>" "<version>2020.01.00-SNAPSHOT</version>"

REM Modify app version
..\..\searchReplace.py pom-ver.xml "<app.version.major.number>5.42.00</app.version.major.number>" "<app.version.major.number>5.42.10</app.version.major.number>"

REM App version
..\..\searchReplace.py pom-ver.xml " <app.version.minor.number>.01</app.version.minor.number>" " <app.version.minor.number></app.version.minor.number>"

REM Service version
..\..\searchReplace.py pom-ver.xml "<frame.version>2019.04.01</frame.version>" "<frame.version>2020.01.00</frame.version>"

git add pom-ver.xml
cd ..

FOR %%i IN (%folders%) DO (
    cd %%i
    git pull
    git checkout  %newBranch% 
    
    REM Parent Version
    python ..\..\searchReplace.py pom.xml "<version>5.42.00.01-SNAPSHOT</version>" "<version>5.42.10-SNAPSHOT</version>"

    git add pom.xml
    git commit -m "TRILL-9268 Create build for TWebBoard 5.42.10"
    git push --set-upstream origin %newBranch%

    cd ..
)
    
    
    