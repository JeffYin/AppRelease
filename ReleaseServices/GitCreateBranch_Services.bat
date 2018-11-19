SET oldbranch=v.2018.07.00
SET newBranch=v.2018.11.00

SET folders=service-achievement-elem service-achievement-sec service-attendance service-school service-staff service-student service-student-enrolment
FOR %%i IN (%folders%) DO (
    cd %%i
    git checkout %oldbranch%
    git checkout -b %newBranch% %oldbranch%
    
    REM service version
    python ..\..\searchReplace.py pom.xml "<service.version>2018.07.00</service.version>" "<service.version>2018.11.00</service.version>"

    REM Frame Version
    python ..\..\searchReplace.py pom.xml "<version>2018.07.00-SNAPSHOT</version>" "<version>2018.11.00-SNAPSHOT</version>"

    git add pom.xml
    git commit -m "Create the branch for Nov. release of 2018"
    git push origin %newBranch%

    cd ..
)
    
    
    