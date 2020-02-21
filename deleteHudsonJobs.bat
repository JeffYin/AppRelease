SET services=service-achievement-elem_v.2019.09.00 ^
service-achievement-sec_v.2019.09.00 ^
service-attendance_v.2019.09.00 ^
service-school_v.2019.09.00 ^
service-staff_v.2019.09.00 ^
service-student-enrolment_v.2019.09.00 ^
service-student_v.2019.09.00 

REM Frame_v.2019.09.00 ^
REM SchoolAdmin_5.42.00 


FOR %%i IN (%services%) DO (
REM Echo Disable Hudson Jobs
wget -S --header="Accept-Encoding: gzip, deflate" --header="Accept-Language: en-US,en;q=0.9,zh-CN;q=0.8,zh;q=0.7" --post-data "" http://trdev-001.srb-es.com:8080/hudson/view/All/job/%%i/doDelete
)


