SET branchName=v.2018.04.00
SET tagName=tag.2018.04.00
SET folders=service-achievement-elem service-achievement-sec service-attendance service-school service-staff service-student service-student-enrolment
FOR %%i IN (%folders%) DO (
    cd %%i
    
    git checkout %branchName%
    git reset --hard origin/%branchName%
    
    REM REM Create Tag: %tagName%.    
    git tag %tagName%
    git push origin %tagName%

    cd ..
)
    
    
    