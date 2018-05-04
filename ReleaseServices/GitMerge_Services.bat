SET branchSour=v.2018.04.00
SET branchDest=master

SET folders=^
 service-achievement-elem ^
 service-achievement-sec ^
 service-attendance ^
 service-school ^
 service-staff ^
 service-student ^
 service-student-enrolment
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
    
    REM ADD all changes
    git add -A 
    
    git commit -m "Merged from %branchSour% to %branchDest%. "
    REM git push origin %branchDest%
    cd ..
)