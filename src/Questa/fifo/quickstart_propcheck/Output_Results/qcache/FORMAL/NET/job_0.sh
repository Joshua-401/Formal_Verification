#! /bin/bash 
/tools/mentor/questa_2019.2_1/linux_x86_64/bin/qverifypm --monitor --host cadpc14 --port 46272 --wd /homes/user/stud/fall19/hz2619/fifo/quickstart_propcheck --type master --binary /tools/mentor/questa_2019.2_1/linux_x86_64/bin/qverifyfk --id 0 -gui -tool prove -import_db Output_Results/formal_compile.db -od Output_Results -client_host cadpc14 -client_port 42128 -netcache /homes/user/stud/fall19/hz2619/fifo/quickstart_propcheck/Output_Results/qcache/FORMAL/NET -pm_host cadpc14 -pm_port 46272   
