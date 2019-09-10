
SET oldbranch=tag.2019.04.00
SET newBranch=v.2019.04.01

REM SET folders=^
REM  service-achievement-elem ^
REM  service-achievement-sec ^
REM  service-attendance ^
REM  service-school ^
REM  service-staff ^
REM  service-student ^
REM  service-student-enrolment

 SET folders=service-student

FOR %%i IN (%folders%) DO (
    cd %%i
    git checkout %oldbranch%
    git pull
    git checkout -b %newBranch%
    
    
    REM service version
    python ..\..\searchReplace.py pom.xml "<service.version>2019.04.00</service.version>" "<service.version>2019.04.01</service.version>"

    REM Frame Version
    python ..\..\searchReplace.py pom.xml "<version>2019.04.00-SNAPSHOT</version>" "<version>2019.04.01-SNAPSHOT</version>"

    git add pom.xml
    git commit -m "TRILL-8708 Create the branch for 2019.04.01 release. "
    git push --set-upstream origin %newBranch%

    cd ..
)
    
    
    