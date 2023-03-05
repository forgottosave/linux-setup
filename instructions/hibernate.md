## Hibernate Setup Guide
Setup hibernation for your linux (ubuntu)

### 0. check kernel sleep states
`cat /sys/power/state` should output `freeze mem disk`
if not, deactivate secure boot in your BIOS
### 1. check swap partition
1.0 `free -mh | grep Mem` RAM < `cat /etc/fstab | grep swap`
1.1 If non is existent see *create swap* below
1.2 Get the UUID with `blkid | grep swap`
### 2. install hibernate tool
`sudo apt install pm-utils hibernate`
### 3. set resume variable
3.0 in grub `/etc/default/grub` add `resume=UUID=<your-swap-uuid>` to the `GRUB_CMDLINE_LINUX_DEFAULT` vars
3.1 update grub with `sudo update-grub``
3.2 create file `/etc/initramfs-tools/conf.d/resume` and add `RESUME=UUID=<your-swap-uuid>`
3.3 regenerate initramfs: `sudo update-initramfs -c -k all`
### 4. hibernate
using `sudo systemctl hibernate`
optional: set alias in .bash_aliases

## Further instructions
### create swap partition
we will use the common linux tool gparted
1. create a new partition and format it as linux-swap
2. copy the UUID
3. add the partition to `/etc/fstab` as `UUID=<your-swap-uuid> none swap sw 0 0`
4. turn on swap: `sudo swapon --all --verbose`
5. check for swap line in `free -mh`
