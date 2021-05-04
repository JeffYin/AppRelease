SET folders=GlobalConfig frame-common frame-dao frame-service frame-war frame-web
set branchDest=v.2020.12.00

FOR %%i IN (%folders%) DO (
    cd %%i
    
    REM Add all Changes
    git pull
    cd ..
)