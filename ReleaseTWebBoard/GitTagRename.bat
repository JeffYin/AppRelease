SET oldTagName=tag.5.40.20
SET newTagName=%oldTagName%.saved
SET folders=ApplicationsForBoard ^
BoardGrouping ^
EIS ^
ESL ^
GLW ^
IntegrationServices ^
Purge

FOR %%i IN (%folders%) DO (
    cd %%i
    
    REM remove the old abmious tag name. 
    git tag %newTagName% %oldTagName%
    git tag -d %oldTagName%
    git push origin :refs/tags/%oldTagName%
    REM git push --tags
    

    cd ..
)
    
    
    