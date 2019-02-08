SET oldbranch=v.2018.11.00
SET newBranch=v.2018.11.01

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
    git checkout %oldbranch%
    git pull
    git checkout -b %newBranch% %oldbranch%
    
    
    REM service version
    python ..\..\searchReplace.py pom.xml "<service.version>2018.11.00</service.version>" "<service.version>2018.11.01</service.version>"

    REM Frame Version
    REM python ..\..\searchReplace.py pom.xml "<version>2018.11.00-SNAPSHOT</version>" "<version>2019.02.00-SNAPSHOT</version>"

    git add pom.xml
    git commit -m "TRILL-6923 Create the branch for SchAdmin 5.41.00.01 Hot fix"
    git push origin %newBranch%

    cd ..
)
    
    
    