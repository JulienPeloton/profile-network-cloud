# Copyright 2024 Julien Peloton
# Author: Julien Peloton
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
import sys
from line_profiler import profile

from py4j.java_gateway import JavaGateway

@profile
def connect_client(hbase_ip, port):
    """Connect HBase client

    Parameters
    ----------
    hbase_ip: str
        IP for the HBase service
    port: int
        Port used by the service

    """
    gateway = JavaGateway(auto_convert=True)
    client = gateway.jvm.com.Lomikel.HBaser.HBaseClient(
        hbase_ip, port
    )


connect_client(sys.argv[1], sys.argv[2])
