SET oldbranch=v.2019.04.00
SET newBranch=v.2019.06.00

SET folders=GlobalConfig frame-common frame-dao frame-service frame-war frame-web
FOR %%i IN (%folders%) DO (
    cd %%i
    git pull
    git checkout -b %newBranch% %oldbranch%
    git pull
    
    ..\..\searchReplace.py pom.xml "<version>2019.04.00-SNAPSHOT</version>" "<version>2019.06.00-SNAPSHOT</version>"

    git add pom.xml
    git commit -m "TRILL-7940 - Create the branches for 2019.06 release."
    git push origin %newBranch%

    cd ..
)
