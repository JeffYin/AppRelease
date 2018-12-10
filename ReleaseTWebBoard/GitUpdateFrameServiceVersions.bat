SET workbranch=master

SET oldAppVersion=5.41.00
SET newAppVersion=5.42.00


SET oldFrameVersion=2018.07.00-SNAPSHOT
SET newFrameVersion=2019.02.00-SNAPSHOT

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
set oldFrameVerStr="<version>%oldFrameVersion%</version>"
set newFrameVerStr="<version>%newFrameVersion%</version>"
python ..\..\searchReplace.py pom-ver.xml %oldFrameVerStr% %newFrameVerStr%

REM App version. Uncomment it out for the normal upgrade.
REM python  ..\..\searchReplace.py pom-ver.xml "<app.version.major.number>5.40.20</app.version.major.number>" "<app.version.major.number>5.41.00</app.version.major.number>"

REM Service version
set oldBoardFrameVerStr="<twebboard.frame.version>%oldFrameVersion%</twebboard.frame.version>"
ste newBoardFrameVerStr="<twebboard.frame.version>%newFrameVersion%</twebboard.frame.version>"
python ..\..\searchReplace.py pom-ver.xml %oldBoardFrameVerStr% %newBoardFrameVerStr%

git add pom-ver.xml
cd ..
REM git commit -m "TRILL-6383 Updated the Frame version to v.%newFrameVersion%."



REM SET oldParentVersion = "<version>%oldAppVersion%-SNAPSHOT</version>"
REM SET newParentVersion = "<version>%oldAppVersion%-SNAPSHOT</version>"
REM FOR %%i IN (%folders%) DO (
REM     cd %%i
REM     git pull
REM     git checkout %workbranch%
    
REM     REM Parent Version
REM     python  ..\..\searchReplace.py pom.xml %oldParentVersion% %newParentVersion%
   
REM     git add pom.xml
REM     git commit -m "TRILL-4258 Updated the version to v.51.00"
REM     REM git push origin %workbranch%

REM     cd ..
REM )

    
    
    