SET branchName=v.2018.04.00
SET tagName=v.2018.05.00
REM SET folders=ApplicationsForSchoolAdmin AdminAttendance IncidentTracking ElementaryAchieveSetup SecondaryAchievementSetup StaffMaintenance StudentMaintenance
SET folders=service-achievement-elem service-achievement-sec service-attendance service-school service-staff service-student service-student-enrolment
FOR %%i IN (%folders%) DO (
    cd %%i
    
    REM git checkout %branchName%
    REM git reset --hard origin/%branchName%
    
    REM REM Create Tag: %tagName%.    
    REM git checkout -b %tagName% %branchName%
    git add pom.xml
    git commit -m "Create the branch for May release of 2018 (TwebOLR)"
    git push origin %tagName%

    cd ..
)
    
    
    