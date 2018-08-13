SET workbranch=master

SET folders=ApplicationsForBoard ^
BoardGrouping ^
EIS ^
ESL ^
GLW ^
IntegrationServices ^
Purge

FOR %%i IN (%folders%) DO (
    cd %%i
    git push origin %workbranch%
    cd ..
)
    
    
    