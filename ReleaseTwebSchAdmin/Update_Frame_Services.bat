SET branch=v.5.42.20


REM modify pom-ver of 
cd ApplicationsForSchoolAdmin
git checkout %branch%
REM Modify parent version
..\..\searchReplace.py pom-ver.xml "<version>2019.09.00-SNAPSHOT</version>" "<version>2020.01.00-SNAPSHOT</version>"

REM App version
REM ..\..\searchReplace.py pom-ver.xml "<app.version.major.number>5.42.10</app.version.major.number>" "<app.version.major.number>5.42.20</app.version.major.number>"

REM Service version
..\..\searchReplace.py pom-ver.xml "<service.version>2019.09.00</service.version>" "<service.version>2020.01.00</service.version>"

git add pom-ver.xml

git commit -m "TRILL-9012 Updated the Frame/Services to 2020.01.00"
git push

