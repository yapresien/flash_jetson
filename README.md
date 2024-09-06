# flash_jetson
how to flash jetson 


how to flash tegra jetson nano 

Target - Tegra 
Host - Ubuntu 22.04 desktop 

Step 1 - Connect tegra host using usb C -A cable
Step 2 - Put target in recover mode , recover mode usually target put to execute a binary that only do file / bit copying
2.1 How to set recover mode 
- long press Power off button(leftmost[1]), shutdown to glow only red led
- hold button 2 recover button 
- press power on/off button(1) 
- donot leave recovery button, count to 10 and then leave
2.2 Verify that target in recovery mode 
- on host terminal run command lsusb
	if in non recovery its running tegra as below bus id vendor id systemid 
	-- 0955:7020 - NVIDIA Corp L4T(Linux for Tegra) running on Tegra
	If running on recovery below system/chip id 7223
	-- 0955:7223 - NVIDIA Corp. APX 
Step 3 - Install dependencies packages using apt
3.1 qemu-user-static
3.2 binutils
3.3 libxml2-utils

Step 4 - Follow seed sutdio link to download 3 tar files
4.1 wget https://developer.nvidia.com/embedded/l4t/r35_release_v1.0/release/jetson_linux_r35.1.0_aarch64.tbz2
4.2 wget https://developer.nvidia.com/embedded/l4t/r35_release_v1.0/release/tegra_linux_sample-root-filesystem_r35.1.0_aarch64.tbz2
4.3 wget https://sourceforge.net/projects/nvidia-jetson/files/Jetson-AGX-Orin-32GB-H01-Kit/Driver-for-JP-5.1.1/AGX-Orin-32GB-H01-JP5.1.1.zip/download

Step 5 - run commands to untar, untar the rootfs in side subfolder and last overwrite, set of commands as below
cd <directory_where_the_files_are_located>

tar xf Jetson_Linux_R35.1.0_aarch64.tbz2

cd Linux_for_tegra/rootfs

sudo tar xfp ../../Tegra_Linux_Sample-Root-Filesystem_R35.1.0_aarch64.tbz2

cd ..

sudo ./apply_binaries.sh

cd ..

sudo apt install unzip 

unzip AGX-Orin-32GB-H01-JP5.0.2.zip

cd Linux_for_Tegra

sudo ./flash.sh jetson‐agx‐orin‐devkit mmcblk0p1

See attached successful logs.
