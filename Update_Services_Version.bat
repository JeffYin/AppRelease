SET branchName=v.2018.04.00
SET tagName=v.2018.05.00
REM SET folders=ApplicationsForSchoolAdmin AdminAttendance IncidentTracking ElementaryAchieveSetup SecondaryAchievementSetup StaffMaintenance StudentMaintenance
SET folders=service-achievement-elem service-achievement-sec service-attendance service-school service-staff service-student service-student-enrolment
FOR %%i IN (%folders%) DO (
    cd %%i
    
    ..\searchReplace.py pom.xml "<service.version>2018.04.00</service.version>" "<service.version>2018.05.00</service.version>"

    cd ..
)
    
    
    