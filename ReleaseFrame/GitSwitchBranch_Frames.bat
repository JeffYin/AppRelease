SET branchName=v.2021.08.00
SET folders=GlobalConfig frame-common frame-dao frame-service frame-war frame-web
 
FOR %%i IN (%folders%) DO (
    cd %%i
    git pull
    git checkout %branchName%
    git pull
    cd ..
)
    
    
    