SET branchName=v.2018.11.00
SET newName=v.2019.02.00
SET folders=GlobalConfig frame-common frame-dao frame-service frame-war frame-web
FOR %%i IN (%folders%) DO (
    cd %%i
    
    git checkout %branchName%
    git branch -D %newName%""
    git push origin --delete  %newName%
    cd ..
)
    
    
    