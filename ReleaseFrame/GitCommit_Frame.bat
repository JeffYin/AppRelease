SET branchSour=v.2018.04.00
SET branchDest=master

SET folders=GlobalConfig frame-common frame-dao frame-service frame-war frame-web
REM git diff v.5.40.45 master --name-only

FOR %%i IN (%folders%) DO (
    cd %%i
    
    REM Add all Changes
    git add -A 
    git commit -m "Merged from %branchSour% to %branchDest%. "
    git push origin %branchDest%
    cd ..
)