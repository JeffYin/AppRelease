


SET tagname=tag.5.42.00.01

SET folders=ApplicationsForSchool ^
Attendance ^
ContinueEd ^
SecondaryAchievement ^
STA ^
SecondaryAchievementReportCard

FOR %%i IN (%folders%) DO (
    cd %%i
    git pull
    git push --delete origin %tagname%
    git tag  --delete  %tagname%
    cd ..
)
    
    
    