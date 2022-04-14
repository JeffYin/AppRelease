SET baseVersion=2021.11.00
SET newVersion=2022.04.00
set ticketNumber=TRIL-10535

SET oldbranch=v.%baseVersion%
SET newBranch=v.%newVersion%


SET folders=GlobalConfig frame-common frame-dao frame-service frame-war frame-web
FOR %%i IN (%folders%) DO (
    cd %%i
    git pull
    git checkout -b %newBranch% %oldbranch%
    git pull
    
    REM ..\..\searchReplace.py pom.xml "<version>2020.11.00-SNAPSHOT</version>" "<version>2020.11.01-SNAPSHOT</version>"
   ..\..\searchReplace.py pom.xml "<version>%baseVersion%-SNAPSHOT</version>" "<version>%newVersion%-SNAPSHOT</version>"
    git add pom.xml
    git commit -m " %ticketNumber% Create New Frame &Services version: %newBranch%"
    git push origin %newBranch%

    cd ..
)
