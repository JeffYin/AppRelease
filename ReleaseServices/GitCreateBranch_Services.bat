
SET oldbranch=v.2019.09.00
SET newBranch=v.2020.01.00

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
    git checkout -b %newBranch%
    
    
    REM service version
    python ..\..\searchReplace.py pom.xml "<service.version>2019.09.00</service.version>" "<service.version>2020.01.00</service.version>"

    REM Frame Version
    python ..\..\searchReplace.py pom.xml "<version>2019.09.00-SNAPSHOT</version>" "<version>2020.01.00-SNAPSHOT</version>"

    git add pom.xml
    git commit -m "TRILL-8640. Created the new version.  "
    git push --set-upstream origin %newBranch%

    cd ..
)
    
    
    