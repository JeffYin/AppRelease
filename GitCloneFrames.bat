call git clone git@gitswarm.powerschool.com:SRB-Trillium/mavenProjectConfig_GlobalConfig.git GlobalConfig
SET folders=frame-common frame-dao frame-service frame-war frame-web
FOR %%i IN (%folders%) DO (
    call git clone git@gitswarm.powerschool.com:SRB-Trillium/eTWebFrame_%%i.git %%i
)
    

    