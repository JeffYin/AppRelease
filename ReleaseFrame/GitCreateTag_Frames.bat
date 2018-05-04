SET branchName=v.2018.04.00
SET tagName=tag.2018.04.00

SET folders=GlobalConfig frame-common frame-dao frame-service frame-war frame-web
FOR %%i IN (%folders%) DO (

   cd %%i
    
    REM remove the old abmious tag name. 
    REM git tag -d v.5.40.45
    REM git push origin :ref/tags/v.5.40.45

    git checkout %branchName%
    git reset --hard origin/%branchName%
    
    REM REM Create Tag: %tagName%.    
    git tag %tagName%
    git push origin %tagName%

    cd ..
)
