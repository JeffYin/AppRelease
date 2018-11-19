REM Disable Hudson Jobs
REM FOR /F %%i IN (hudson_jobs.txt) DO (
REM wget -S --header="Accept-Encoding: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" --header="Content-Type: application/x-www-form-urlencoded" --post-data "Submit=Disable+job&json={}" http://trdev-001:8080/hudson/view/All/job/%%i/disable
REM )

REM Enable Hudson Jobs
SET HodsonJobs=^
Frame_2018.11.00-Git ^
service-achievement-elem_v.2018.11.00-Git ^
service-achievement-sec_v.2018.11.00-Git ^
service-attendance-v.1.2018.11.00-Git ^
service-school_v.2018.11.00-Git ^
service-staff_v.2018.11.00-Git ^
service-student-enrolment_v.2018.11.00-Git ^
service-student_v.2018.11.00-Git 


REM FOR %%i IN (%HodsonJobs%) DO (
REM wget -S --header="Accept-Encoding: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" ^
REM  --header="Content-Type: application/x-www-form-urlencoded" ^
REM  --post-data "Submit=Disable+job&json={}" ^
REM  http://trdev-001.srb-es.com:8080/hudson/view/All/job/%%i/disable
REM )

FOR %%i IN (%HodsonJobs%) DO (
wget -S --header="Accept-Encoding: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" ^
 --header="Content-Type: application/x-www-form-urlencoded" ^
 --post-data "Submit=Disable+job&json={}" ^
 http://trdev-001.srb-es.com:8080/hudson/view/All/job/%%i/enable
)