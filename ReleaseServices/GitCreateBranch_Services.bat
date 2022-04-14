
SET baseVersion=2021.11.00
SET newVersion=2022.04.00
set ticketNumber=TRILL-10535

SET oldbranch=v.%baseVersion%
SET newBranch=v.%newVersion%

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
    python ..\..\searchReplace.py pom.xml  "<service.version>%baseVersion%</service.version>"  "<service.version>%newVersion%</service.version>" 

    REM Frame Version
    python ..\..\searchReplace.py pom.xml  "<version>%baseVersion%-SNAPSHOT</version>" "<version>%newVersion%-SNAPSHOT</version>" 

    git add pom.xml
    git commit -m "%ticketNumber% Create New Frame & Services version: %newBranch%"
    git push --set-upstream origin %newBranch%

    cd ..
)
    
    
    