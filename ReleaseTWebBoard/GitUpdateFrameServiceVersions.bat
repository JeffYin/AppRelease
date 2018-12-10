SET workbranch=master

SET oldAppVersion=5.41.00
SET newAppVersion=5.42.00


SET oldFrameVersion=2018.07.00
SET newFrameVersion=2019.02.00

SET folders=ApplicationsForBoard ^
BoardGrouping ^
EIS ^
ESL ^
GLW ^
IntegrationServices ^
Purge


REM modify pom-ver of 
cd ApplicationsForBoard

REM App version. Uncomment it out for the normal upgrade.
set oldAppVerStr="<app.version.major.number>%oldAppVersion%</app.version.major.number>"
set newAppVerStr="<frame.version>%newAppVersion%</frame.version>"
python ..\..\searchReplace.py pom-ver.xml %oldAppVerStr% %newAppVerStr%


REM Modify Frame version
set oldFrameVerStr="<frame.version>%oldFrameVersion%</frame.version>"
set newFrameVerStr="<frame.version>%newFrameVersion%</frame.version>"
python ..\..\searchReplace.py pom-ver.xml %oldFrameVerStr% %newFrameVerStr%

git add pom-ver.xml
cd ..

SET oldParentVersion = "<version>%oldAppVersion%-SNAPSHOT</version>"
SET newParentVersion = "<version>%newAppVersion%-SNAPSHOT</version>"
FOR %%i IN (%folders%) DO (
    cd %%i
    git pull
    git checkout %workbranch%
    
    REM Parent Version
    python  ..\..\searchReplace.py pom.xml %oldParentVersion% %newParentVersion%
   
    git add pom.xml
    git commit -m "TRILL-4258 Updated the version to v.51.00"
    REM git push origin %workbranch%

    cd ..
)

    
    
    