SET branchName=v.2020.01.00
SET tagName=tag.2020.01.00
SET folders=service-achievement-elem service-achievement-sec service-attendance service-school service-staff service-student service-student-enrolment
FOR %%i IN (%folders%) DO (
    cd %%i
    git pull

    cd ..
)
    
    
    