REM SET branchSour=v.5.40.45
REM SET branchDest=master

SET branchSour=master
SET branchDest=v.5.40.50

REM SET folders=ApplicationsForSchoolAdmin AdminAttendance IncidentTracking ElementaryAchieveSetup SecondaryAchievementSetup StaffMaintenance StudentMaintenance
SET folders=ApplicationsForSchoolAdmin AdminAttendance IncidentTracking ElementaryAchieveSetup StaffMaintenance StudentMaintenance
REM git diff v.5.40.45 master --name-only
git config --global merge.ours.driver true

FOR %%i IN (%folders%) DO (
    cd %%i
    
    REM Synchronize to the remote source branch
    git checkout %branchSour%
    git reset --hard origin/%branchSour%

    REM Synchronize to the remote Dest branch
    git checkout %branchDest%
    git reset --hard origin/%branchDest%

    echo pom.xml merge=ours >> .gitattributes

    git merge --strategy=ours --no-ff %branchSour%

    REM discard the changes of .gitattributes
    git checkout -- .gitattributes

    REM git commit -m "Merged from %branchSour% to %branchDest%. "
    git push
    cd ..
)