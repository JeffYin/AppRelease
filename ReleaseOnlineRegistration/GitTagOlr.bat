SET branchName=master
SET tagName=tag.1.73.20
SET folders=OnlineRegistration
FOR %%i IN (%folders%) DO (
    cd %%i
    
    git checkout %branchName%
    git reset --hard origin/%branchName%
    git pull
    
    REM REM Create Tag: %tagName%.    
    git tag %tagName%
    git push origin %tagName%

    cd ..
)
    
    
    