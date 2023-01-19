## Known issues on Linux:
### During installation:
Run `install.sh`

If this happens:
`bash: /sbin/udevadm: No such file or directory`

Run `which udevadm`

Replace the given path into `install.sh`, on line 9 and 10

### After installation:
`sudo apt-get install -y libsdl2-2.0-0`

If this shows up:
`libssl.so.1.1: cannot open shared object file: No such file or directory`
Missing lib `libssl1.1`
Can be downloaded [here](https://packages.ubuntu.com/focal/libssl1.1).
***

### Once connected to the board:
`Failed to load module "canberra-gtk-module"`

Fix:
`sudo apt install libcanberra-gtk-module libcanberra-gtk3-module`
or
`sudo apt-get install libcanberra-gtk-module`

