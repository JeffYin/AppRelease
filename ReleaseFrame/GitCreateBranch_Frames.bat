SET oldbranch=v.2018.07.00
SET newBranch=v.2018.11.00

SET folders=GlobalConfig frame-common frame-dao frame-service frame-war frame-web
FOR %%i IN (%folders%) DO (
    cd %%i
    git checkout -b %newBranch% %oldbranch%
    
    ..\..\searchReplace.py pom.xml "<version>2018.04.00-SNAPSHOT</version>" "<version>2018.07.00-SNAPSHOT</version>"

    git add pom.xml
    git commit -m "Create the branches for July release of 2018"
    git push origin %newBranch%

    cd ..
)
