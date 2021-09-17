SET branchName=v.2021.05.00
SET newName=v.2021.08.00
SET folders=GlobalConfig frame-common frame-dao frame-service frame-war frame-web
FOR %%i IN (%folders%) DO (
    cd %%i
    
    git checkout %branchName%
    git branch -D %newName%""
    git push origin --delete  %newName%
    cd ..
)
    
    
    