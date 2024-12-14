# Profiling test for VD networks

Fire a VM (alma linux 9), log as root and execute the installation script:

```bash
python -m venv env
source env/bin/activate

./install_and_launch_gateway.sh
```

Then profile the connection by running:

```bash
./profile.sh <HBASEIP> <PORT>
```

## Results

Here are the timings:

| |time (second)|
|-|-------------|
|public| 0.05 |
|public-2|3.3|

### Public

```bash
Total time: 0.0487013 s
File: app.py
Function: connect_client at line 20

Line #      Hits         Time  Per Hit   % Time  Line Contents
==============================================================
    20                                           @profile
    21                                           def connect_client(hbase_ip, port):
    22                                               """Connect HBase client
    23                                           
    24                                               Parameters
    25                                               ----------
    26                                               hbase_ip: str
    27                                                   IP for the HBase service
    28                                               port: int
    29                                                   Port used by the service
    30                                           
    31                                               """
    32         1         65.0     65.0      0.1      gateway = JavaGateway(auto_convert=True)
    33         2      48636.0  24318.0     99.9      client = gateway.jvm.com.Lomikel.HBaser.HBaseClient(
    34         1          0.2      0.2      0.0          hbase_ip, port
    35                                               )

  0.05 seconds - app.py:20 - connect_client
```

### Public-2

```bash
Total time: 3.25974 s
File: app.py
Function: connect_client at line 20

Line #      Hits         Time  Per Hit   % Time  Line Contents
==============================================================
    20                                           @profile                                                
    21                                           def connect_client(hbase_ip, port):                     
    22                                               """Connect HBase client                             
    23                                                                                                   
    24                                               Parameters                                          
    25                                               ----------                                          
    26                                               hbase_ip: str                                       
    27                                                   IP for the HBase service                        
    28                                               port: int                                           
    29                                                   Port used by the service                        
    30                                                                                                   
    31                                               """                                                 
    32         1        129.8    129.8      0.0      gateway = JavaGateway(auto_convert=True)            
    33         2    3259607.3    2e+06    100.0      client = gateway.jvm.com.Lomikel.HBaser.HBaseClient(
    34         1          0.4      0.4      0.0          hbase_ip, port                                  
    35                                               )                                                   


  3.26 seconds - app.py:20 - connect_client
```
