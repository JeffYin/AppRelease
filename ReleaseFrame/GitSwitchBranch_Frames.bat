SET branchName=v.2021.11.00-log4j2
SET folders=GlobalConfig frame-common frame-dao frame-service frame-war frame-web
 
FOR %%i IN (%folders%) DO (
    cd %%i
    git pull
    git checkout %branchName%
    git pull
    cd ..
)
    
    
    