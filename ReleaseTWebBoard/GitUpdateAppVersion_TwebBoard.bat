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
REM ..\..\searchReplace.py pom-ver.xml "<version>2018.11.00-SNAPSHOT</version>" "<version>2019.02.00-SNAPSHOT</version>"

REM App version
..\..\searchReplace.py pom-ver.xml " <app.version.minor.number></app.version.minor.number>" " <app.version.minor.number>.01</app.version.minor.number>"

REM Service version
REM ..\..\searchReplace.py pom-ver.xml "<service.version>2018.11.00</service.version>" "<service.version>2019.02.00</service.version>"

git add pom-ver.xml
cd ..

FOR %%i IN (%folders%) DO (
    cd %%i
    git pull
    git checkout  %newBranch% 
    
    REM Parent Version
    python ..\..\searchReplace.py pom.xml "<version>5.42.00-SNAPSHOT</version>" "<version>5.42.00.01-SNAPSHOT</version>"

    git add pom.xml
    git commit -m "TRILL-8708 Created the v.5.42.00.01."
    git push --set-upstream origin %newBranch%

    cd ..
)
    
    
    