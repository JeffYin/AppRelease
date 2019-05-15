
SET oldbranch=v.2019.04.00
SET newBranch=v.2019.06.00

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
    python ..\..\searchReplace.py pom.xml "<service.version>2019.04.00</service.version>" "<service.version>2019.06.00</service.version>"

    REM Frame Version
    python ..\..\searchReplace.py pom.xml "<version>2019.04.00-SNAPSHOT</version>" "<version>2019.06.00-SNAPSHOT</version>"

    git add pom.xml
    git commit -m "TRILL-8020 Create the branch for 2019.06 release. "
    git push origin %newBranch%

    cd ..
)
    
    
    