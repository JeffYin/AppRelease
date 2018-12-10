SET branchName=v.2018.11.00
SET newName=v.2019.02.00
SET folders=service-achievement-elem service-achievement-sec service-attendance service-school service-staff service-student service-student-enrolment
FOR %%i IN (%folders%) DO (
    cd %%i
    
    git checkout %branchName%
    git branch -D %newName%""
    git push origin --delete  %newName%
    cd ..
)
    
    
    