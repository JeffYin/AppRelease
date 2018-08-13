SET workbranch=master

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
python ..\..\searchReplace.py pom-ver.xml "<version>5.40.80-SNAPSHOT</version>" "<version>2018.07.00-SNAPSHOT</version>"

REM App version
python  ..\..\searchReplace.py pom-ver.xml "<app.version.major.number>5.40.20</app.version.major.number>" "<app.version.major.number>5.41.00</app.version.major.number>"

REM Service version
python ..\..\searchReplace.py pom-ver.xml "<twebboard.frame.version>5.40.80-SNAPSHOT</twebboard.frame.version>" "<twebboard.frame.version>2018.07.00-SNAPSHOT</twebboard.frame.version>"

git add pom-ver.xml
cd ..

FOR %%i IN (%folders%) DO (
    cd %%i
    git pull
    git checkout %workbranch%
    
    REM Parent Version
    python  ..\..\searchReplace.py pom.xml "<version>5.40.20-SNAPSHOT</version>" "<version>5.41.00-SNAPSHOT</version>"
   
    git add pom.xml
    git commit -m "TRILL-4258 Updated the version to v.51.00"
    REM git push origin %workbranch%

    cd ..
)

    
    
    