SET folders=ApplicationsForBoard ^
BoardGrouping ^
EIS ^
ESL ^
GLW ^
IntegrationServices ^
Purge

FOR %%i IN (%folders%) DO (
    call git clone git@gitswarm.powerschool.com:SRB-Trillium/eTrillium_%%i.git %%i
)
