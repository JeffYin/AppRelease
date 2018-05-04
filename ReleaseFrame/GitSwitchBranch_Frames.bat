SET branchName=v.2018.07.00
SET folders=GlobalConfig frame-common frame-dao frame-service frame-war frame-web
 
FOR %%i IN (%folders%) DO (
    cd %%i
    git checkout %branchName%
    cd ..
)
    
    
    