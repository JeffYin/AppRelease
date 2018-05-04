SET branchSour=v.2018.04.00
SET branchDest=master

SET folders=GlobalConfig frame-common frame-dao frame-service frame-war frame-web
REM git diff v.5.40.45 master --name-only

FOR %%i IN (%folders%) DO (
    cd %%i
    
    REM Synchronize to the remote source branch
    git checkout %branchSour%
    git reset --hard origin/%branchSour%

    REM Synchronize to the remote Dest branch
    git checkout %branchDest%
    git reset --hard origin/%branchDest%

    git merge --no-ff %branchSour%

    git commit -m "Merged from %branchSour% to %branchDest%. "
    REM git push origin %branchDest%
    cd ..
)