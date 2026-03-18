# Lab0 Linux 设备信息

## 设备信息命令与输出

```bash
uname -a
lscpu | head -n 20
free -h
lsblk
cat /etc/os-release
```

```text
$ uname -a
Linux user-WUJIE14XA 6.17.0-19-generic #19~24.04.2-Ubuntu SMP PREEMPT_DYNAMIC Fri Mar  6 23:08:46 UTC 2 x86_64 x86_64 x86_64 GNU/Linux

$ lscpu | head -n 20
Architecture:                            x86_64
CPU op-mode(s):                          32-bit, 64-bit
Address sizes:                           48 bits physical, 48 bits virtual
Byte Order:                              Little Endian
CPU(s):                                  16
On-line CPU(s) list:                     0-15
Vendor ID:                               AuthenticAMD
Model name:                              AMD Ryzen 7 8745HS w/ Radeon 780M Graphics
CPU family:                              25
Model:                                   117
Thread(s) per core:                      2
Core(s) per socket:                      8
Socket(s):                               1
Stepping:                                2
Frequency boost:                         enabled
CPU(s) scaling MHz:                      86%
CPU max MHz:                             4966.6401
CPU min MHz:                             405.4400
BogoMIPS:                                7586.18
Flags:                                   fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good amd_lbr_v2 nopl xtopology nonstop_tsc cpuid extd_apicid aperfmperf rapl pni pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 x2apic movbe popcnt aes xsave avx f16c rdrand lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs skinit wdt tce topoext perfctr_core perfctr_nb bpext perfctr_llc mwaitx cpuid_fault cpb cat_l3 cdp_l3 hw_pstate ssbd mba perfmon_v2 ibrs ibpb stibp ibrs_enhanced vmmcall fsgsbase bmi1 avx2 smep bmi2 erms invpcid cqm rdt_a avx512f avx512dq rdseed adx smap avx512ifma clflushopt clwb avx512cd sha_ni avx512bw avx512vl xsaveopt xsavec xgetbv1 xsaves cqm_llc cqm_occup_llc cqm_mbm_total cqm_mbm_local user_shstk avx512_bf16 clzero irperf xsaveerptr rdpru wbnoinvd cppc arat npt lbrv svm_lock nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold vgif x2avic v_spec_ctrl vnmi avx512vbmi umip pku ospke avx512_vbmi2 gfni vaes vpclmulqdq avx512_vnni avx512_bitalg avx512_vpopcntdq rdpid overflow_recov succor smca fsrm flush_l1d

$ free -h
               total        used        free      shared  buff/cache   available
Mem:            14Gi       6.7Gi       4.9Gi       125Mi       3.1Gi       8.2Gi
Swap:           29Gi          0B        29Gi

$ lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0         7:0    0     4K  1 loop /snap/bare/5
loop1         7:1    0   181M  1 loop /snap/chromium/3375
loop2         7:2    0  63.8M  1 loop /snap/core20/2686
loop3         7:3    0  63.8M  1 loop /snap/core20/2717
loop4         7:4    0    74M  1 loop /snap/core22/2292
loop5         7:5    0    74M  1 loop /snap/core22/2339
loop6         7:6    0  66.9M  1 loop /snap/core24/1349
loop7         7:7    0  66.8M  1 loop /snap/core24/1499
loop8         7:8    0  48.8M  1 loop /snap/cups/1146
loop9         7:9    0 254.6M  1 loop /snap/firefox/7901
loop10        7:10   0 254.9M  1 loop /snap/firefox/7967
loop11        7:11   0  18.5M  1 loop /snap/firmware-updater/210
loop12        7:12   0   516M  1 loop /snap/gnome-42-2204/202
loop13        7:13   0  16.4M  1 loop /snap/firmware-updater/216
loop14        7:14   0 531.4M  1 loop /snap/gnome-42-2204/247
loop15        7:15   0  91.7M  1 loop /snap/gtk-common-themes/1535
loop16        7:16   0 163.9M  1 loop /snap/joplin-desktop/134
loop17        7:17   0 606.1M  1 loop /snap/gnome-46-2404/153
loop18        7:18   0 163.7M  1 loop /snap/joplin-desktop/136
loop19        7:19   0   395M  1 loop /snap/mesa-2404/1165
loop20        7:20   0  10.8M  1 loop /snap/snap-store/1270
loop21        7:21   0  48.1M  1 loop /snap/snapd/25935
loop22        7:22   0  48.4M  1 loop /snap/snapd/26382
loop23        7:23   0   576K  1 loop /snap/snapd-desktop-integration/315
loop24        7:24   0   576K  1 loop /snap/snapd-desktop-integration/343
loop25        7:25   0   227M  1 loop /snap/thunderbird/1001
loop26        7:26   0 227.5M  1 loop /snap/thunderbird/1017
nvme1n1     259:0    0 476.9G  0 disk 
├─nvme1n1p1 259:8    0   128M  0 part 
├─nvme1n1p2 259:9    0   100M  0 part 
├─nvme1n1p3 259:10   0 149.8G  0 part 
├─nvme1n1p4 259:11   0   326G  0 part 
└─nvme1n1p5 259:12   0   904M  0 part 
nvme0n1     259:1    0 931.5G  0 disk 
├─nvme0n1p1 259:2    0  1000M  0 part /boot/efi
├─nvme0n1p2 259:3    0 630.5G  0 part 
├─nvme0n1p3 259:4    0  29.8G  0 part [SWAP]
├─nvme0n1p4 259:5    0  46.6G  0 part /
├─nvme0n1p5 259:6    0   954M  0 part /boot
└─nvme0n1p6 259:7    0 222.7G  0 part /home

$ cat /etc/os-release
PRETTY_NAME="Ubuntu 24.04.4 LTS"
NAME="Ubuntu"
VERSION_ID="24.04"
VERSION="24.04.4 LTS (Noble Numbat)"
VERSION_CODENAME=noble
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=noble
LOGO=ubuntu-logo
```

## 设备信息截图

![linux screenshot 1](./src/Screenshot%20from%202026-03-18%2023-19-41.png)

![linux screenshot 2](./src/Screenshot%20from%202026-03-18%2023-22-14.png)

![linux screenshot 3](./src/Screenshot%20from%202026-03-18%2023-23-20.png)
