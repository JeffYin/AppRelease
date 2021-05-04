


SET tagname=tag.2021.05.00

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
    git pull
    git push --delete origin %tagname%
    git tag  --delete  %tagname%
    cd ..
)
    
    
    