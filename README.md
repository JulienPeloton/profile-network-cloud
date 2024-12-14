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
