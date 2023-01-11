## Known issues on Linux:
### During installation:
Run `install.sh`

If this happens:
`bash: /sbin/udevadm: No such file or directory`

Run `which udevadm`

Replace the given path into `install.sh`

### After installation:
`libssl.so.1.1: cannot open shared object file: No such file or directory`

Missing lib `libssl1.1_1.1.1f-1ubuntu2.16_amd64.deb`

Can be downloaded [here](http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb).
Package source [website](https://ubuntu.pkgs.org/20.04/ubuntu-main-amd64/libssl1.1_1.1.1f-1ubuntu2_amd64.deb.html).

### Once connected to the board:
`Failed to load module "canberra-gtk-module"`

Fix:
`sudo apt install libcanberra-gtk-module libcanberra-gtk3-module`
or
`sudo apt-get install libcanberra-gtk-module`

