

import os
cmd = "net use \\\\hyper-v-001.srb-es.com\Trillium /USER:srbdomain\jeffy Srb20190502 /PERSISTENT:NO" 
print(cmd)
os.system(cmd)

