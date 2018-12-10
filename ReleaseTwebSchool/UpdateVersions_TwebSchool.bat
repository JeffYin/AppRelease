SET newBranch=master

SET folders=ApplicationsForSchool ^
Attendance ^
ContinueEd ^
SecondaryAchievement ^
STA ^
SecondaryAchievementReportCard

set msg="TRILL-5969 Update the version to 5.42.00"
 cd ApplicationsForSchool
  ..\..\searchReplace.py pom-ver.xml "<app.version.major.number>5.41.10</app.version.major.number>" "<app.version.major.number>5.42.00</app.version.major.number>"
  git add pom-ver.xml
  git commit -m %msg%

FOR %%i IN (%folders%) DO (
    cd %%i
    REM Parent Version
     ..\..\searchReplace.py pom.xml "<version>5.41.10-SNAPSHOT</version>" "<version>5.42.00-SNAPSHOT</version>"

    git add pom.xml
    git commit -m %msg%
    git push origin %newBranch%

    cd ..
)
    
    
    