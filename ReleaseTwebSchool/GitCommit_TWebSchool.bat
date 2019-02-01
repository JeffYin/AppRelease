SET branchSour=v.2018.04.00
SET branchDest=master

SET folders=ApplicationsForSchool ^
Attendance ^
ContinueEd ^
SecondaryAchievement ^
STA ^
SecondaryAchievementReportCard
REM git diff v.5.40.45 master --name-only

FOR %%i IN (%folders%) DO (
    cd %%i
    
    REM ADD all changes
    git add -A 
    
    git commit -m "Merged from %branchSour% to %branchDest%. "
    git push origin %branchDest%
    cd ..
)