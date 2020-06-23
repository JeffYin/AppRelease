REM Disable Hudson Jobs
REM FOR /F %%i IN (hudson_jobs.txt) DO (
REM wget -S --header="Accept-Encoding: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" --header="Content-Type: application/x-www-form-urlencoded" --post-data "Submit=Disable+job&json={}" http://trdev-001:8080/hudson/view/All/job/%%i/disable
REM )

REM Enable Hudson Jobs
SET HodsonJobs=^
SET services=service-achievement-elem_v.2020.01.00 ^
service-achievement-sec_v.2020.01.00 ^
service-attendance_v.2020.01.00 ^
service-school_v.2020.01.00 ^
service-staff_v.2020.01.00 ^
service-student-enrolment_v.2020.01.00 ^
service-student_v.2020.01.00 ^
Frame_v.2020.01.00 ^
SchoolAdmin_5.42.20 ^
SchoolAdmin_5.42.30 

REM SchoolAdmin_5.41.20-Git 
REM DISABLE Jobs
FOR %%i IN (%HodsonJobs%) DO (
wget -S --header="Accept-Encoding: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" ^
 --header="Content-Type: application/x-www-form-urlencoded" ^
 --post-data "Submit=Disable+job&json={}" ^
 http://trdev-001.srb-es.com:8080/hudson/view/All/job/%%i/disable
)


REM Enable Jobs
REM FOR %%i IN (%HodsonJobs%) DO (
REM wget -S --header="Accept-Encoding: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" ^
REM  --header="Content-Type: application/x-www-form-urlencoded" ^
REM  --post-data "Submit=Enable+job&json={}" ^
REM  http://trdev-001.srb-es.com:8080/hudson/view/All/job/%%i/enable
REM )