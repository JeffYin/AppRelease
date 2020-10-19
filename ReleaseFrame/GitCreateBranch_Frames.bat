SET oldbranch=v.2020.11.00
SET newBranch=v.2020.11.01

SET folders=GlobalConfig frame-common frame-dao frame-service frame-war frame-web
FOR %%i IN (%folders%) DO (
    cd %%i
    git pull
    git checkout -b %newBranch% %oldbranch%
    git pull
    
    ..\..\searchReplace.py pom.xml "<version>2020.11.00-SNAPSHOT</version>" "<version>2020.11.01-SNAPSHOT</version>"

    git add pom.xml
    git commit -m "TRILL-9727 Create New Frame &Services version: 2020.11.01"
    git push origin %newBranch%

    cd ..
)
