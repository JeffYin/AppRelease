SET versionToBeTagged=2020.11.00

SET branchName=v.%versionToBeTagged%
SET tagName=tag.%versionToBeTagged%

SET folders=GlobalConfig frame-common frame-dao frame-service frame-war frame-web
FOR %%i IN (%folders%) DO (

   cd %%i
    
    REM remove the old abmious tag name. 
    REM git tag -d v.5.40.45
    REM git push origin :ref/tags/v.5.40.45

    git checkout %branchName%
    git reset --hard origin/%branchName%
    git pull
    
    REM REM Create Tag: %tagName%.    
    git tag %tagName%
    git push origin %tagName%

    cd ..
)
