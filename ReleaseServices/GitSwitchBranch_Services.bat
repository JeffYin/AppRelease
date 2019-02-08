SET branchName=v.2019.02.00
SET folders=^
 service-achievement-elem ^
 service-achievement-sec ^
 service-attendance ^
 service-school ^
 service-staff ^
 service-student ^
 service-student-enrolment
 
FOR %%i IN (%folders%) DO (
    cd %%i
    git fetch
    git checkout %branchName%
    git pull
    cd ..
)
    
    
    