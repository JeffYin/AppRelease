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

REM call git clone git@gitswarm.powerschool.com:SRB-Trillium/eTrillium_ApplicationsForBoard.git ApplicationsForBoard
REM call git clone git@gitswarm.powerschool.com:SRB-Trillium/eTrillium_BoardGrouping.git BoardGrouping
REM call git clone git@gitswarm.powerschool.com:SRB-Trillium/eTrillium_EIS.git EIS
REM call git clone git@gitswarm.powerschool.com:SRB-Trillium/eTrillium_ESL.git ESL
REM call git clone git@gitswarm.powerschool.com:SRB-Trillium/eTrillium_GLW.git GLW
REM call git clone git@gitswarm.powerschool.com:SRB-Trillium/eTrillium_IntegrationServices.git IntegrationServices
REM call git clone git@gitswarm.powerschool.com:SRB-Trillium/eTrillium_Purge.git Purge


rem the order of Hudson BoardApplication build. 
rem call git clone git@gitswarm.powerschool.com:SRB-Trillium/eTrillium_ApplicationsForBoard.git ApplicationsForBoard
rem call git clone git@gitswarm.powerschool.com:SRB-Trillium/eTrillium_ESL.git ESL
rem call git clone git@gitswarm.powerschool.com:SRB-Trillium/eTrillium_BoardGrouping.git BoardGrouping
rem call git clone git@gitswarm.powerschool.com:SRB-Trillium/eTrillium_IntegrationServices.git IntegrationServices
rem call git clone git@gitswarm.powerschool.com:SRB-Trillium/eTrillium_GLW.git GLW
rem call git clone git@gitswarm.powerschool.com:SRB-Trillium/eTrillium_Purge.git Purge
rem call git clone git@gitswarm.powerschool.com:SRB-Trillium/eTrillium_EIS.git EIS
