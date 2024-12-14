#!/bin/bash
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
echo "Installing python package"
pip install -r requirements.txt

echo "Install Java"
sudo dnf install -y java-11-openjdk java-11-openjdk-devel
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.25.0.9-3.el9.x86_64/

echo "Downloading binaries"
BASEURL=https://hrivnac.web.cern.ch/Activities/Packages/Lomikel
CLIENTVERSION=03.04.00x


files="Lomikel-$CLIENTVERSION-ext.jar Lomikel-$CLIENTVERSION.exe.jar Lomikel-$CLIENTVERSION-HBase.jar Lomikel-$CLIENTVERSION-HBase.exe.jar Lomikel-$CLIENTVERSION.jar"

for file in $files; do
        echo $file
        wget --directory-prefix=. $BASEURL/$file
done

echo "Launching the gateway"
nohup java -cp "Lomikel-03.04.00x-HBase.exe.jar:py4j0.10.9.7.jar" com.Lomikel.Py4J.LomikelGatewayServer &
