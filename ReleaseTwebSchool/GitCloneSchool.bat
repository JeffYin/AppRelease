SET folders=ApplicationsForSchool ^
Attendance ^
ContinueEd ^
SecondaryAchievement ^
STA 

FOR %%i IN (%folders%) DO (
    call git clone git@gitswarm.powerschool.com:SRB-Trillium/eTrillium_%%i.git %%i
)

call git clone git@gitswarm.powerschool.com:SRB-Trillium/eTrillium_TrilliumServices_SecondaryAchievementReportCard.git SecondaryAchievementReportCard
