SET oldbranch=v.2018.11.00
SET newBranch=v.2019.02.00

SET folders=GlobalConfig frame-common frame-dao frame-service frame-war frame-web
FOR %%i IN (%folders%) DO (
    cd %%i
    git pull
    git checkout -b %newBranch% %oldbranch%
    
    ..\..\searchReplace.py pom.xml "<version>2018.11.00-SNAPSHOT</version>" "<version>2019.02.00-SNAPSHOT</version>"

    git add pom.xml
    git commit -m "TRILL-6319 - Create the branches for 2019.02 release."
    git push origin %newBranch%

    cd ..
)
