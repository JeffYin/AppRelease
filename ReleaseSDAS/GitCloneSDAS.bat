SET folders=Admin ^
SDAS

FOR %%i IN (%folders%) DO (
    call git clone git@gitlab.powerschool.com:SRB-Trillium/eSDAS_%%i.git %%i
)

