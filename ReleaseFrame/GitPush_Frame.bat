SET folders=GlobalConfig frame-common frame-dao frame-service frame-war frame-web
set branchName=v.2021.03.00

FOR %%i IN (%folders%) DO (
    cd %%i
    git checkout %branchName%
    REM Add all Changes
    git push origin %branchName%
    cd ..
)