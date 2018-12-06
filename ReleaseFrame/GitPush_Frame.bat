SET folders=GlobalConfig frame-common frame-dao frame-service frame-war frame-web

FOR %%i IN (%folders%) DO (
    cd %%i
    
    REM Add all Changes
    git push origin %branchDest%
    cd ..
)