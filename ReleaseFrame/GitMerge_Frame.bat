SET branchSour=v.2020.01.00
SET branchDest=master

SET folders=GlobalConfig frame-common frame-dao frame-service frame-war frame-web
REM git diff v.5.40.45 master --name-only

FOR %%i IN (%folders%) DO (
    cd %%i
    
    REM Synchronize to the remote source branch
    git checkout %branchSour%
    git reset --hard origin/%branchSour%
    git pull

    REM Synchronize to the remote Dest branch
    git checkout %branchDest%
    git reset --hard origin/%branchDest%
    git pull

    git merge --no-ff %branchSour%

    git commit -m "TRILL-9446 Merge Frame 2020.01.00 to the master before creating the new build TwebSchAdmin 5.42.40 "
    git push origin %branchDest%
    cd ..
)