SET branchName=v.2018.07.00
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
    git checkout %branchName%
    cd ..
)
    
    
    