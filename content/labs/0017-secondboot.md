---
layout: lab
title: Second Boot
permalink: /lab/logs/second-boot/
module: Logs
---

Logs for the second boot.

{: .console-output}
```
-- Logs begin at Mon 2017-12-11 09:29:54 UTC, end at Mon 2017-12-11 09:44:34 UTC. --
Dec 11 09:44:20 localhost kernel: random: get_random_bytes called from start_kernel+0x42/0x4cf with crng_init=0
Dec 11 09:44:20 localhost kernel: Linux version 4.13.16-coreos-r2 (jenkins@jenkins-worker-5) (gcc version 4.9.4 (Gentoo Hardened 4.9.4 p1.0, pie-0.6.4)) #1 SMP Wed Dec 6 04:27:34 UTC 2017
Dec 11 09:44:20 localhost kernel: Command line: BOOT_IMAGE=/coreos/vmlinuz-a mount.usr=/dev/mapper/usr verity.usr=PARTUUID=7130c94a-213a-4e5a-8e26-6cce9662f132 rootflags=rw mount.usrflags=ro consoleblank=0 root=LABEL=ROOT console=ttyS0,115200n8 coreos.oem.id=ec2 modprobe.blacklist=xen_fbfront net.ifnames=0 verity.usrhash=071bf5f9e6e8622a733f2e8ac999ac40fa64641180dbfbe2e92f0aaf1bfcb78f
Dec 11 09:44:20 localhost kernel: x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
Dec 11 09:44:20 localhost kernel: x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
Dec 11 09:44:20 localhost kernel: x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
Dec 11 09:44:20 localhost kernel: x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
Dec 11 09:44:20 localhost kernel: x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
Dec 11 09:44:20 localhost kernel: e820: BIOS-provided physical RAM map:
Dec 11 09:44:20 localhost kernel: BIOS-e820: [mem 0x0000000000000000-0x000000000009dfff] usable
Dec 11 09:44:20 localhost kernel: BIOS-e820: [mem 0x000000000009e000-0x000000000009ffff] reserved
Dec 11 09:44:20 localhost kernel: BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] reserved
Dec 11 09:44:20 localhost kernel: BIOS-e820: [mem 0x0000000000100000-0x000000003fffffff] usable
Dec 11 09:44:20 localhost kernel: BIOS-e820: [mem 0x00000000fc000000-0x00000000ffffffff] reserved
Dec 11 09:44:20 localhost kernel: NX (Execute Disable) protection: active
Dec 11 09:44:20 localhost kernel: random: fast init done
Dec 11 09:44:20 localhost kernel: SMBIOS 2.7 present.
Dec 11 09:44:20 localhost kernel: DMI: Xen HVM domU, BIOS 4.2.amazon 08/24/2006
Dec 11 09:44:20 localhost kernel: Hypervisor detected: Xen HVM
Dec 11 09:44:20 localhost kernel: Xen version 4.2.
Dec 11 09:44:20 localhost kernel: Xen Platform PCI: I/O protocol version 1
Dec 11 09:44:20 localhost kernel: Netfront and the Xen platform PCI driver have been compiled for this kernel: unplug emulated NICs.
Dec 11 09:44:20 localhost kernel: Blkfront and the Xen platform PCI driver have been compiled for this kernel: unplug emulated disks.
                                  You might have to change the root device
                                  from /dev/hd[a-d] to /dev/xvd[a-d]
                                  in your root= kernel command line option
Dec 11 09:44:20 localhost kernel: HVMOP_pagetable_dying not supported
Dec 11 09:44:20 localhost kernel: tsc: Fast TSC calibration using PIT
Dec 11 09:44:20 localhost kernel: e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
Dec 11 09:44:20 localhost kernel: e820: remove [mem 0x000a0000-0x000fffff] usable
Dec 11 09:44:20 localhost kernel: e820: last_pfn = 0x40000 max_arch_pfn = 0x400000000
Dec 11 09:44:20 localhost kernel: MTRR default type: write-back
Dec 11 09:44:20 localhost kernel: MTRR fixed ranges enabled:
Dec 11 09:44:20 localhost kernel:   00000-9FFFF write-back
Dec 11 09:44:20 localhost kernel:   A0000-BFFFF write-combining
Dec 11 09:44:20 localhost kernel:   C0000-FFFFF write-back
Dec 11 09:44:20 localhost kernel: MTRR variable ranges enabled:
Dec 11 09:44:20 localhost kernel:   0 base 0000F0000000 mask 3FFFF8000000 uncachable
Dec 11 09:44:20 localhost kernel:   1 base 0000F8000000 mask 3FFFFC000000 uncachable
Dec 11 09:44:20 localhost kernel:   2 disabled
Dec 11 09:44:20 localhost kernel:   3 disabled
Dec 11 09:44:20 localhost kernel:   4 disabled
Dec 11 09:44:20 localhost kernel:   5 disabled
Dec 11 09:44:20 localhost kernel:   6 disabled
Dec 11 09:44:20 localhost kernel:   7 disabled
Dec 11 09:44:20 localhost kernel: x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WC  UC- WT
Dec 11 09:44:20 localhost kernel: Base memory trampoline at [ffff90cf80098000] 98000 size 24576
Dec 11 09:44:20 localhost kernel: BRK [0x37f2f000, 0x37f2ffff] PGTABLE
Dec 11 09:44:20 localhost kernel: BRK [0x37f30000, 0x37f30fff] PGTABLE
Dec 11 09:44:20 localhost kernel: BRK [0x37f31000, 0x37f31fff] PGTABLE
Dec 11 09:44:20 localhost kernel: BRK [0x37f32000, 0x37f32fff] PGTABLE
Dec 11 09:44:20 localhost kernel: ACPI: Early table checksum verification disabled
Dec 11 09:44:20 localhost kernel: ACPI: RSDP 0x00000000000EA020 000024 (v02 Xen   )
Dec 11 09:44:20 localhost kernel: ACPI: XSDT 0x00000000FC00DDC0 000054 (v01 Xen    HVM      00000000 HVML 00000000)
Dec 11 09:44:20 localhost kernel: ACPI: FACP 0x00000000FC00DA80 0000F4 (v04 Xen    HVM      00000000 HVML 00000000)
Dec 11 09:44:20 localhost kernel: ACPI: DSDT 0x00000000FC001CE0 00BD19 (v02 Xen    HVM      00000000 INTL 20090123)
Dec 11 09:44:20 localhost kernel: ACPI: FACS 0x00000000FC001CA0 000040
Dec 11 09:44:20 localhost kernel: ACPI: FACS 0x00000000FC001CA0 000040
Dec 11 09:44:20 localhost kernel: ACPI: APIC 0x00000000FC00DB80 0000D8 (v02 Xen    HVM      00000000 HVML 00000000)
Dec 11 09:44:20 localhost kernel: ACPI: HPET 0x00000000FC00DCD0 000038 (v01 Xen    HVM      00000000 HVML 00000000)
Dec 11 09:44:20 localhost kernel: ACPI: WAET 0x00000000FC00DD10 000028 (v01 Xen    HVM      00000000 HVML 00000000)
Dec 11 09:44:20 localhost kernel: ACPI: SSDT 0x00000000FC00DD40 000031 (v02 Xen    HVM      00000000 INTL 20090123)
Dec 11 09:44:20 localhost kernel: ACPI: SSDT 0x00000000FC00DD80 000031 (v02 Xen    HVM      00000000 INTL 20090123)
Dec 11 09:44:20 localhost kernel: ACPI: Local APIC address 0xfee00000
Dec 11 09:44:20 localhost kernel: No NUMA configuration found
Dec 11 09:44:20 localhost kernel: Faking a node at [mem 0x0000000000000000-0x000000003fffffff]
Dec 11 09:44:20 localhost kernel: NODE_DATA(0) allocated [mem 0x3fffa000-0x3fffffff]
Dec 11 09:44:20 localhost kernel: Zone ranges:
Dec 11 09:44:20 localhost kernel:   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
Dec 11 09:44:20 localhost kernel:   DMA32    [mem 0x0000000001000000-0x000000003fffffff]
Dec 11 09:44:20 localhost kernel:   Normal   empty
Dec 11 09:44:20 localhost kernel: Movable zone start for each node
Dec 11 09:44:20 localhost kernel: Early memory node ranges
Dec 11 09:44:20 localhost kernel:   node   0: [mem 0x0000000000001000-0x000000000009dfff]
Dec 11 09:44:20 localhost kernel:   node   0: [mem 0x0000000000100000-0x000000003fffffff]
Dec 11 09:44:20 localhost kernel: Initmem setup node 0 [mem 0x0000000000001000-0x000000003fffffff]
Dec 11 09:44:20 localhost kernel: On node 0 totalpages: 262045
Dec 11 09:44:20 localhost kernel:   DMA zone: 64 pages used for memmap
Dec 11 09:44:20 localhost kernel:   DMA zone: 21 pages reserved
Dec 11 09:44:20 localhost kernel:   DMA zone: 3997 pages, LIFO batch:0
Dec 11 09:44:20 localhost kernel:   DMA32 zone: 4032 pages used for memmap
Dec 11 09:44:20 localhost kernel:   DMA32 zone: 258048 pages, LIFO batch:31
Dec 11 09:44:20 localhost kernel: ACPI: PM-Timer IO Port: 0xb008
Dec 11 09:44:20 localhost kernel: ACPI: Local APIC address 0xfee00000
Dec 11 09:44:20 localhost kernel: IOAPIC[0]: apic_id 1, version 17, address 0xfec00000, GSI 0-47
Dec 11 09:44:20 localhost kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
Dec 11 09:44:20 localhost kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 low level)
Dec 11 09:44:20 localhost kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 low level)
Dec 11 09:44:20 localhost kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 low level)
Dec 11 09:44:20 localhost kernel: ACPI: IRQ0 used by override.
Dec 11 09:44:20 localhost kernel: ACPI: IRQ5 used by override.
Dec 11 09:44:20 localhost kernel: ACPI: IRQ9 used by override.
Dec 11 09:44:20 localhost kernel: ACPI: IRQ10 used by override.
Dec 11 09:44:20 localhost kernel: ACPI: IRQ11 used by override.
Dec 11 09:44:20 localhost kernel: Using ACPI (MADT) for SMP configuration information
Dec 11 09:44:20 localhost kernel: ACPI: HPET id: 0x8086a201 base: 0xfed00000
Dec 11 09:44:20 localhost kernel: smpboot: Allowing 15 CPUs, 14 hotplug CPUs
Dec 11 09:44:20 localhost kernel: e820: [mem 0x40000000-0xfbffffff] available for PCI devices
Dec 11 09:44:20 localhost kernel: Booting paravirtualized kernel on Xen HVM
Dec 11 09:44:20 localhost kernel: clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
Dec 11 09:44:20 localhost kernel: setup_percpu: NR_CPUS:512 nr_cpumask_bits:512 nr_cpu_ids:15 nr_node_ids:1
Dec 11 09:44:20 localhost kernel: percpu: Embedded 38 pages/cpu @ffff90cfbe200000 s115032 r8192 d32424 u262144
Dec 11 09:44:20 localhost kernel: pcpu-alloc: s115032 r8192 d32424 u262144 alloc=1*2097152
Dec 11 09:44:20 localhost kernel: pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 12 13 14 --
Dec 11 09:44:20 localhost kernel: xen: PV spinlocks enabled
Dec 11 09:44:20 localhost kernel: PV qspinlock hash table entries: 256 (order: 0, 4096 bytes)
Dec 11 09:44:20 localhost kernel: Built 1 zonelists in Node order, mobility grouping on.  Total pages: 257928
Dec 11 09:44:20 localhost kernel: Policy zone: DMA32
Dec 11 09:44:20 localhost kernel: Kernel command line: rootflags=rw mount.usrflags=ro BOOT_IMAGE=/coreos/vmlinuz-a mount.usr=/dev/mapper/usr verity.usr=PARTUUID=7130c94a-213a-4e5a-8e26-6cce9662f132 rootflags=rw mount.usrflags=ro consoleblank=0 root=LABEL=ROOT console=ttyS0,115200n8 coreos.oem.id=ec2 modprobe.blacklist=xen_fbfront net.ifnames=0 verity.usrhash=071bf5f9e6e8622a733f2e8ac999ac40fa64641180dbfbe2e92f0aaf1bfcb78f
Dec 11 09:44:20 localhost kernel: PID hash table entries: 4096 (order: 3, 32768 bytes)
Dec 11 09:44:20 localhost kernel: Memory: 980980K/1048180K available (6320K kernel code, 1218K rwdata, 2704K rodata, 33984K init, 740K bss, 67200K reserved, 0K cma-reserved)
Dec 11 09:44:20 localhost kernel: SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=15, Nodes=1
Dec 11 09:44:20 localhost kernel: ftrace: allocating 26629 entries in 105 pages
Dec 11 09:44:20 localhost kernel: Hierarchical RCU implementation.
Dec 11 09:44:20 localhost kernel:         RCU event tracing is enabled.
Dec 11 09:44:20 localhost kernel:         RCU restricting CPUs from NR_CPUS=512 to nr_cpu_ids=15.
Dec 11 09:44:20 localhost kernel: RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=15
Dec 11 09:44:20 localhost kernel: NR_IRQS: 33024, nr_irqs: 952, preallocated irqs: 16
Dec 11 09:44:20 localhost kernel: xen:events: Using 2-level ABI
Dec 11 09:44:20 localhost kernel: xen:events: Xen HVM callback vector for event delivery is enabled
Dec 11 09:44:20 localhost kernel: Console: colour VGA+ 80x25
Dec 11 09:44:20 localhost kernel: Cannot get hvm parameter CONSOLE_EVTCHN (18): -22!
Dec 11 09:44:20 localhost kernel: console [ttyS0] enabled
Dec 11 09:44:20 localhost kernel: clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 30580167144 ns
Dec 11 09:44:20 localhost kernel: hpet clockevent registered
Dec 11 09:44:20 localhost kernel: tsc: Fast TSC calibration using PIT
Dec 11 09:44:20 localhost kernel: tsc: Detected 2400.045 MHz processor
Dec 11 09:44:20 localhost kernel: Calibrating delay loop (skipped), value calculated using timer frequency.. 4800.10 BogoMIPS (lpj=2400050)
Dec 11 09:44:20 localhost kernel: pid_max: default: 32768 minimum: 301
Dec 11 09:44:20 localhost kernel: ACPI: Core revision 20170531
Dec 11 09:44:20 localhost kernel: ACPI: 3 ACPI AML tables successfully acquired and loaded
Dec 11 09:44:20 localhost kernel: Security Framework initialized
Dec 11 09:44:20 localhost kernel: SELinux:  Initializing.
Dec 11 09:44:20 localhost kernel: SELinux:  Starting in permissive mode
Dec 11 09:44:20 localhost kernel: Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes)
Dec 11 09:44:20 localhost kernel: Inode-cache hash table entries: 65536 (order: 7, 524288 bytes)
Dec 11 09:44:20 localhost kernel: Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)
Dec 11 09:44:20 localhost kernel: Mountpoint-cache hash table entries: 2048 (order: 2, 16384 bytes)
Dec 11 09:44:20 localhost kernel: CPU: Physical Processor ID: 0
Dec 11 09:44:20 localhost kernel: mce: CPU supports 2 MCE banks
Dec 11 09:44:20 localhost kernel: Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 1024
Dec 11 09:44:20 localhost kernel: Last level dTLB entries: 4KB 1024, 2MB 1024, 4MB 1024, 1GB 4
Dec 11 09:44:20 localhost kernel: smpboot: Max logical packages: 15
Dec 11 09:44:20 localhost kernel: x2apic: IRQ remapping doesn't support X2APIC mode
Dec 11 09:44:20 localhost kernel: Switched APIC routing to physical flat.
Dec 11 09:44:20 localhost kernel: ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=0 pin2=0
Dec 11 09:44:20 localhost kernel: clocksource: xen: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
Dec 11 09:44:20 localhost kernel: Xen: using vcpuop timer interface
Dec 11 09:44:20 localhost kernel: installing Xen timer for CPU 0
Dec 11 09:44:20 localhost kernel: smpboot: CPU0: Intel(R) Xeon(R) CPU E5-2676 v3 @ 2.40GHz (family: 0x6, model: 0x3f, stepping: 0x2)
Dec 11 09:44:20 localhost kernel: cpu 0 spinlock event irq 53
Dec 11 09:44:20 localhost kernel: Performance Events: unsupported p6 CPU model 63 no PMU driver, software events only.
Dec 11 09:44:20 localhost kernel: Hierarchical SRCU implementation.
Dec 11 09:44:20 localhost kernel: NMI watchdog: disabled (cpu0): hardware events not enabled
Dec 11 09:44:20 localhost kernel: NMI watchdog: Shutting down hard lockup detector on all cpus
Dec 11 09:44:20 localhost kernel: smp: Bringing up secondary CPUs ...
Dec 11 09:44:20 localhost kernel: smp: Brought up 1 node, 1 CPU
Dec 11 09:44:20 localhost kernel: smpboot: Total of 1 processors activated (4800.10 BogoMIPS)
Dec 11 09:44:20 localhost kernel: devtmpfs: initialized
Dec 11 09:44:20 localhost kernel: x86/mm: Memory block size: 128MB
Dec 11 09:44:20 localhost kernel: clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
Dec 11 09:44:20 localhost kernel: futex hash table entries: 4096 (order: 6, 262144 bytes)
Dec 11 09:44:20 localhost kernel: pinctrl core: initialized pinctrl subsystem
Dec 11 09:44:20 localhost kernel: NET: Registered protocol family 16
Dec 11 09:44:20 localhost kernel: cpuidle: using governor menu
Dec 11 09:44:20 localhost kernel: PCCT header not found.
Dec 11 09:44:20 localhost kernel: ACPI: bus type PCI registered
Dec 11 09:44:20 localhost kernel: acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
Dec 11 09:44:20 localhost kernel: dca service started, version 1.12.1
Dec 11 09:44:20 localhost kernel: PCI: Using configuration type 1 for base access
Dec 11 09:44:20 localhost kernel: HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
Dec 11 09:44:20 localhost kernel: ACPI: Added _OSI(Module Device)
Dec 11 09:44:20 localhost kernel: ACPI: Added _OSI(Processor Device)
Dec 11 09:44:20 localhost kernel: ACPI: Added _OSI(3.0 _SCP Extensions)
Dec 11 09:44:20 localhost kernel: ACPI: Added _OSI(Processor Aggregator Device)
Dec 11 09:44:20 localhost kernel: xen: --> pirq=16 -> irq=9 (gsi=9)
Dec 11 09:44:20 localhost kernel: ACPI: Interpreter enabled
Dec 11 09:44:20 localhost kernel: ACPI: (supports S0 S3 S5)
Dec 11 09:44:20 localhost kernel: ACPI: Using IOAPIC for interrupt routing
Dec 11 09:44:20 localhost kernel: PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
Dec 11 09:44:20 localhost kernel: ACPI: Enabled 2 GPEs in block 00 to 0F
Dec 11 09:44:20 localhost kernel: ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
Dec 11 09:44:20 localhost kernel: acpi PNP0A03:00: _OSC: OS supports [ASPM ClockPM Segments MSI]
Dec 11 09:44:20 localhost kernel: acpi PNP0A03:00: _OSC failed (AE_NOT_FOUND); disabling ASPM
Dec 11 09:44:20 localhost kernel: acpi PNP0A03:00: fail to add MMCONFIG information, can't access extended PCI configuration space under this bridge.
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [0] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [3] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [4] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [5] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [6] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [7] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [8] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [9] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [10] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [11] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [12] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [13] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [14] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [15] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [16] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [17] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [18] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [19] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [20] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [21] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [22] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [23] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [24] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [25] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [26] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [27] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [28] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [29] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [30] registered
Dec 11 09:44:20 localhost kernel: acpiphp: Slot [31] registered
Dec 11 09:44:20 localhost kernel: PCI host bridge to bus 0000:00
Dec 11 09:44:20 localhost kernel: pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
Dec 11 09:44:20 localhost kernel: pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
Dec 11 09:44:20 localhost kernel: pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
Dec 11 09:44:20 localhost kernel: pci_bus 0000:00: root bus resource [mem 0xf0000000-0xfbffffff window]
Dec 11 09:44:20 localhost kernel: pci_bus 0000:00: root bus resource [bus 00-ff]
Dec 11 09:44:20 localhost kernel: pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
Dec 11 09:44:20 localhost kernel: pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
Dec 11 09:44:20 localhost kernel: pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
Dec 11 09:44:20 localhost kernel: pci 0000:00:01.1: reg 0x20: [io  0xc100-0xc10f]
Dec 11 09:44:20 localhost kernel: pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  0x01f0-0x01f7]
Dec 11 09:44:20 localhost kernel: pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
Dec 11 09:44:20 localhost kernel: pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  0x0170-0x0177]
Dec 11 09:44:20 localhost kernel: pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
Dec 11 09:44:20 localhost kernel: pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
Dec 11 09:44:20 localhost kernel: * Found PM-Timer Bug on the chipset. Due to workarounds for a bug,
                                  * this clock source is slow. Consider trying other clock sources
Dec 11 09:44:20 localhost kernel: pci 0000:00:01.3: quirk: [io  0xb000-0xb03f] claimed by PIIX4 ACPI
Dec 11 09:44:20 localhost kernel: pci 0000:00:02.0: [1013:00b8] type 00 class 0x030000
Dec 11 09:44:20 localhost kernel: pci 0000:00:02.0: reg 0x10: [mem 0xf0000000-0xf1ffffff pref]
Dec 11 09:44:20 localhost kernel: pci 0000:00:02.0: reg 0x14: [mem 0xf3000000-0xf3000fff]
Dec 11 09:44:20 localhost kernel: pci 0000:00:03.0: [5853:0001] type 00 class 0xff8000
Dec 11 09:44:20 localhost kernel: pci 0000:00:03.0: reg 0x10: [io  0xc000-0xc0ff]
Dec 11 09:44:20 localhost kernel: pci 0000:00:03.0: reg 0x14: [mem 0xf2000000-0xf2ffffff pref]
Dec 11 09:44:20 localhost kernel: ACPI: PCI Interrupt Link [LNKA] (IRQs *5 10 11)
Dec 11 09:44:20 localhost kernel: ACPI: PCI Interrupt Link [LNKB] (IRQs 5 *10 11)
Dec 11 09:44:20 localhost kernel: ACPI: PCI Interrupt Link [LNKC] (IRQs 5 10 *11)
Dec 11 09:44:20 localhost kernel: ACPI: PCI Interrupt Link [LNKD] (IRQs *5 10 11)
Dec 11 09:44:20 localhost kernel: xen:balloon: Initialising balloon driver
Dec 11 09:44:20 localhost kernel: pci 0000:00:02.0: vgaarb: setting as boot VGA device
Dec 11 09:44:20 localhost kernel: pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
Dec 11 09:44:20 localhost kernel: pci 0000:00:02.0: vgaarb: bridge control possible
Dec 11 09:44:20 localhost kernel: vgaarb: loaded
Dec 11 09:44:20 localhost kernel: PCI: Using ACPI for IRQ routing
Dec 11 09:44:20 localhost kernel: PCI: pci_cache_line_size set to 64 bytes
Dec 11 09:44:20 localhost kernel: e820: reserve RAM buffer [mem 0x0009e000-0x0009ffff]
Dec 11 09:44:20 localhost kernel: HPET: 3 timers in total, 0 timers will be used for per-cpu timer
Dec 11 09:44:20 localhost kernel: hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
Dec 11 09:44:20 localhost kernel: hpet0: 3 comparators, 64-bit 62.500000 MHz counter
Dec 11 09:44:20 localhost kernel: clocksource: Switched to clocksource xen
Dec 11 09:44:20 localhost kernel: VFS: Disk quotas dquot_6.6.0
Dec 11 09:44:20 localhost kernel: VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
Dec 11 09:44:20 localhost kernel: pnp: PnP ACPI init
Dec 11 09:44:20 localhost kernel: system 00:00: [mem 0x00000000-0x0009ffff] could not be reserved
Dec 11 09:44:20 localhost kernel: system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
Dec 11 09:44:20 localhost kernel: system 00:01: [io  0x08a0-0x08a3] has been reserved
Dec 11 09:44:20 localhost kernel: system 00:01: [io  0x0cc0-0x0ccf] has been reserved
Dec 11 09:44:20 localhost kernel: system 00:01: [io  0x04d0-0x04d1] has been reserved
Dec 11 09:44:20 localhost kernel: system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
Dec 11 09:44:20 localhost kernel: xen: --> pirq=17 -> irq=8 (gsi=8)
Dec 11 09:44:20 localhost kernel: pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (active)
Dec 11 09:44:20 localhost kernel: xen: --> pirq=18 -> irq=12 (gsi=12)
Dec 11 09:44:20 localhost kernel: pnp 00:03: Plug and Play ACPI device, IDs PNP0f13 (active)
Dec 11 09:44:20 localhost kernel: xen: --> pirq=19 -> irq=1 (gsi=1)
Dec 11 09:44:20 localhost kernel: pnp 00:04: Plug and Play ACPI device, IDs PNP0303 PNP030b (active)
Dec 11 09:44:20 localhost kernel: xen: --> pirq=20 -> irq=6 (gsi=6)
Dec 11 09:44:20 localhost kernel: pnp 00:05: [dma 2]
Dec 11 09:44:20 localhost kernel: pnp 00:05: Plug and Play ACPI device, IDs PNP0700 (active)
Dec 11 09:44:20 localhost kernel: xen: --> pirq=21 -> irq=4 (gsi=4)
Dec 11 09:44:20 localhost kernel: pnp 00:06: Plug and Play ACPI device, IDs PNP0501 (active)
Dec 11 09:44:20 localhost kernel: system 00:07: [io  0x10c0-0x1141] has been reserved
Dec 11 09:44:20 localhost kernel: system 00:07: [io  0xb044-0xb047] has been reserved
Dec 11 09:44:20 localhost kernel: system 00:07: Plug and Play ACPI device, IDs PNP0c02 (active)
Dec 11 09:44:20 localhost kernel: pnp: PnP ACPI: found 8 devices
Dec 11 09:44:20 localhost kernel: clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
Dec 11 09:44:20 localhost kernel: pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
Dec 11 09:44:20 localhost kernel: pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
Dec 11 09:44:20 localhost kernel: pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
Dec 11 09:44:20 localhost kernel: pci_bus 0000:00: resource 7 [mem 0xf0000000-0xfbffffff window]
Dec 11 09:44:20 localhost kernel: NET: Registered protocol family 2
Dec 11 09:44:20 localhost kernel: TCP established hash table entries: 8192 (order: 4, 65536 bytes)
Dec 11 09:44:20 localhost kernel: TCP bind hash table entries: 8192 (order: 5, 131072 bytes)
Dec 11 09:44:20 localhost kernel: TCP: Hash tables configured (established 8192 bind 8192)
Dec 11 09:44:20 localhost kernel: UDP hash table entries: 512 (order: 2, 16384 bytes)
Dec 11 09:44:20 localhost kernel: UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)
Dec 11 09:44:20 localhost kernel: NET: Registered protocol family 1
Dec 11 09:44:20 localhost kernel: pci 0000:00:00.0: Limiting direct PCI/PCI transfers
Dec 11 09:44:20 localhost kernel: pci 0000:00:01.0: PIIX3: Enabling Passive Release
Dec 11 09:44:20 localhost kernel: pci 0000:00:01.0: Activating ISA DMA hang workarounds
Dec 11 09:44:20 localhost kernel: pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
Dec 11 09:44:20 localhost kernel: PCI: CLS 0 bytes, default 64
Dec 11 09:44:20 localhost kernel: RAPL PMU: API unit is 2^-32 Joules, 4 fixed counters, 655360 ms ovfl timer
Dec 11 09:44:20 localhost kernel: RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
Dec 11 09:44:20 localhost kernel: RAPL PMU: hw unit of domain package 2^-14 Joules
Dec 11 09:44:20 localhost kernel: RAPL PMU: hw unit of domain dram 2^-14 Joules
Dec 11 09:44:20 localhost kernel: RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
Dec 11 09:44:20 localhost kernel: audit: initializing netlink subsys (disabled)
Dec 11 09:44:20 localhost kernel: Initialise system trusted keyrings
Dec 11 09:44:20 localhost kernel: audit: type=2000 audit(1512985460.151:1): state=initialized audit_enabled=0 res=1
Dec 11 09:44:20 localhost kernel: workingset: timestamp_bits=39 max_order=18 bucket_order=0
Dec 11 09:44:20 localhost kernel: SELinux:  Registering netfilter hooks
Dec 11 09:44:20 localhost kernel: Key type asymmetric registered
Dec 11 09:44:20 localhost kernel: Asymmetric key parser 'x509' registered
Dec 11 09:44:20 localhost kernel: Block layer SCSI generic (bsg) driver version 0.4 loaded (major 251)
Dec 11 09:44:20 localhost kernel: io scheduler noop registered
Dec 11 09:44:20 localhost kernel: io scheduler deadline registered
Dec 11 09:44:20 localhost kernel: io scheduler cfq registered (default)
Dec 11 09:44:20 localhost kernel: io scheduler mq-deadline registered
Dec 11 09:44:20 localhost kernel: io scheduler kyber registered
Dec 11 09:44:20 localhost kernel: intel_idle: does not run on family 6 model 63
Dec 11 09:44:20 localhost kernel: GHES: HEST is not enabled!
Dec 11 09:44:20 localhost kernel: ioatdma: Intel(R) QuickData Technology Driver 4.00
Dec 11 09:44:20 localhost kernel: xen: --> pirq=22 -> irq=28 (gsi=28)
Dec 11 09:44:20 localhost kernel: xen:grant_table: Grant tables using version 1 layout
Dec 11 09:44:20 localhost kernel: Grant table initialized
Dec 11 09:44:20 localhost kernel: Cannot get hvm parameter CONSOLE_EVTCHN (18): -22!
Dec 11 09:44:20 localhost kernel: Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
Dec 11 09:44:20 localhost kernel: 00:06: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
Dec 11 09:44:20 localhost kernel: i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
Dec 11 09:44:20 localhost kernel: serio: i8042 KBD port at 0x60,0x64 irq 1
Dec 11 09:44:20 localhost kernel: serio: i8042 AUX port at 0x60,0x64 irq 12
Dec 11 09:44:20 localhost kernel: input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
Dec 11 09:44:20 localhost kernel: rtc_cmos 00:02: rtc core: registered rtc_cmos as rtc0
Dec 11 09:44:20 localhost kernel: rtc_cmos 00:02: alarms up to one day, 114 bytes nvram, hpet irqs
Dec 11 09:44:20 localhost kernel: ip_tables: (C) 2000-2006 Netfilter Core Team
Dec 11 09:44:20 localhost kernel: NET: Registered protocol family 10
Dec 11 09:44:20 localhost kernel: Segment Routing with IPv6
Dec 11 09:44:20 localhost kernel: NET: Registered protocol family 17
Dec 11 09:44:20 localhost kernel: Key type dns_resolver registered
Dec 11 09:44:20 localhost kernel: sched_clock: Marking stable (1212150353, 0)->(8934657443, -7722507090)
Dec 11 09:44:20 localhost kernel: registered taskstats version 1
Dec 11 09:44:20 localhost kernel: Loading compiled-in X.509 certificates
Dec 11 09:44:20 localhost kernel: Loaded X.509 cert 'CoreOS, Inc: Module signing key for 4.13.16-coreos-r2: 1554f8e30ca18dd9dba0e055bd5af48ac518dbed'
Dec 11 09:44:20 localhost kernel: ima: No TPM chip found, activating TPM-bypass! (rc=-19)
Dec 11 09:44:20 localhost kernel: xenbus_probe_frontend: Device with no driver: device/vbd/51712
Dec 11 09:44:20 localhost kernel: xenbus_probe_frontend: Device with no driver: device/vif/0
Dec 11 09:44:20 localhost kernel: rtc_cmos 00:02: setting system clock to 2017-12-11 09:44:20 UTC (1512985460)
Dec 11 09:44:20 localhost kernel: Freeing unused kernel memory: 33984K
Dec 11 09:44:20 localhost kernel: Write protecting the kernel read-only data: 12288k
Dec 11 09:44:20 localhost kernel: Freeing unused kernel memory: 1860K
Dec 11 09:44:20 localhost kernel: Freeing unused kernel memory: 1392K
Dec 11 09:44:20 localhost systemd[1]: systemd 234 running in system mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK -SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT -GNUTLS -ACL +XZ +LZ4 +SECCOMP +BLKID -ELFUTILS +KMOD -IDN2 -IDN default-hierarchy=legacy)
Dec 11 09:44:20 localhost systemd[1]: Detected virtualization xen.
Dec 11 09:44:20 localhost systemd[1]: Detected architecture x86-64.
Dec 11 09:44:20 localhost systemd[1]: Running in initial RAM disk.
Dec 11 09:44:20 localhost systemd[1]: No hostname configured.
Dec 11 09:44:20 localhost systemd[1]: Set hostname to <localhost>.
Dec 11 09:44:20 localhost systemd[1]: Initializing machine ID from random generator.
Dec 11 09:44:20 localhost systemd[1]: Listening on udev Control Socket.
Dec 11 09:44:20 localhost systemd[1]: Listening on Journal Socket.
Dec 11 09:44:20 localhost systemd[1]: Listening on Journal Socket (/dev/log).
Dec 11 09:44:20 localhost systemd-journald[124]: Journal started
Dec 11 09:44:20 localhost systemd-journald[124]: Runtime journal (/run/log/journal/302fcbe2432e4ff7844a63889881c718) is 6.2M, max 49.7M, 43.5M free.
Dec 11 09:44:20 localhost systemd-sysctl[126]: Couldn't write 'fq_codel' to 'net/core/default_qdisc', ignoring: No such file or directory
Dec 11 09:44:20 localhost kernel: audit: type=1130 audit(1512985460.715:2): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-journald comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:20 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-journald comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:20 localhost systemd[1]: Started Create list of required static device nodes for the current kernel.
Dec 11 09:44:20 localhost systemd[1]: Started Apply Kernel Variables.
Dec 11 09:44:20 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=kmod-static-nodes comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:20 localhost kernel: audit: type=1130 audit(1512985460.738:3): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=kmod-static-nodes comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:20 localhost systemd[1]: Starting Create Static Device Nodes in /dev...
Dec 11 09:44:20 localhost dracut-cmdline[131]: dracut-dracut-045
Dec 11 09:44:20 localhost systemd[1]: Started Create Static Device Nodes in /dev.
Dec 11 09:44:20 localhost dracut-cmdline[131]: Using kernel command line parameters: rootflags=rw mount.usrflags=ro BOOT_IMAGE=/coreos/vmlinuz-a mount.usr=/dev/mapper/usr verity.usr=PARTUUID=7130c94a-213a-4e5a-8e26-6cce9662f132 rootflags=rw mount.usrflags=ro consoleblank=0 root=LABEL=ROOT console=ttyS0,115200n8 coreos.oem.id=ec2 modprobe.blacklist=xen_fbfront net.ifnames=0 verity.usrhash=071bf5f9e6e8622a733f2e8ac999ac40fa64641180dbfbe2e92f0aaf1bfcb78f
Dec 11 09:44:20 localhost kernel: audit: type=1130 audit(1512985460.756:4): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-sysctl comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:20 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-sysctl comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:20 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-tmpfiles-setup-dev comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:20 localhost kernel: audit: type=1130 audit(1512985460.810:5): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-tmpfiles-setup-dev comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:20 localhost systemd[1]: Started dracut cmdline hook.
Dec 11 09:44:20 localhost systemd[1]: Starting dracut pre-udev hook...
Dec 11 09:44:20 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-cmdline comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:20 localhost kernel: audit: type=1130 audit(1512985460.853:6): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-cmdline comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:20 localhost kernel: device-mapper: uevent: version 1.0.3
Dec 11 09:44:20 localhost kernel: device-mapper: ioctl: 4.37.0-ioctl (2017-09-20) initialised: dm-devel@redhat.com
Dec 11 09:44:20 localhost systemd[1]: Started dracut pre-udev hook.
Dec 11 09:44:20 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-pre-udev comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:20 localhost kernel: audit: type=1130 audit(1512985460.914:7): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-pre-udev comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:20 localhost systemd[1]: Starting udev Kernel Device Manager...
Dec 11 09:44:20 localhost systemd-udevd[212]: Network interface NamePolicy= disabled on kernel command line, ignoring.
Dec 11 09:44:20 localhost systemd-udevd[212]: Invalid rule /usr/lib64/udev/rules.d/73-seat-late.rules:15: RUN{builtin}: 'uaccess' unknown
Dec 11 09:44:20 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-udevd comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:20 localhost systemd[1]: Started udev Kernel Device Manager.
Dec 11 09:44:20 localhost kernel: audit: type=1130 audit(1512985460.942:8): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-udevd comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:20 localhost systemd[1]: Starting dracut pre-trigger hook...
Dec 11 09:44:20 localhost dracut-pre-trigger[222]: rd.md=0: removing MD RAID activation
Dec 11 09:44:21 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-pre-trigger comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:21 localhost systemd[1]: Started dracut pre-trigger hook.
Dec 11 09:44:21 localhost kernel: audit: type=1130 audit(1512985461.012:9): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-pre-trigger comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:21 localhost systemd[1]: Starting udev Coldplug all Devices...
Dec 11 09:44:21 localhost systemd-udevd[212]: Network interface NamePolicy= disabled on kernel command line, ignoring.
Dec 11 09:44:21 localhost kernel: tsc: Refined TSC clocksource calibration: 2399.998 MHz
Dec 11 09:44:21 localhost kernel: clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x229835b7123, max_idle_ns: 440795242976 ns
Dec 11 09:44:21 localhost systemd-udevd[212]: Invalid rule /usr/lib64/udev/rules.d/73-seat-late.rules:15: RUN{builtin}: 'uaccess' unknown
Dec 11 09:44:21 localhost systemd[1]: Started udev Coldplug all Devices.
Dec 11 09:44:21 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-udev-trigger comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:21 localhost kernel: audit: type=1130 audit(1512985461.116:10): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-udev-trigger comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:21 localhost systemd[1]: Starting dracut initqueue hook...
Dec 11 09:44:21 localhost systemd[1]: Reached target System Initialization.
Dec 11 09:44:21 localhost systemd[1]: Reached target Basic System.
Dec 11 09:44:21 localhost kernel: SCSI subsystem initialized
Dec 11 09:44:21 localhost kernel: Invalid max_queues (4), will use default max: 1.
Dec 11 09:44:21 localhost kernel: xen_netfront: Initialising Xen virtual ethernet driver
Dec 11 09:44:21 localhost systemd-udevd[291]: link_config: autonegotiation is unset or enabled, the speed and duplex are not writable.
Dec 11 09:44:21 localhost kernel: libata version 3.00 loaded.
Dec 11 09:44:21 localhost kernel: ata_piix 0000:00:01.1: version 2.13
Dec 11 09:44:21 localhost kernel: AVX2 version of gcm_enc/dec engaged.
Dec 11 09:44:21 localhost kernel: AES CTR mode by8 optimization enabled
Dec 11 09:44:21 localhost kernel: scsi host0: ata_piix
Dec 11 09:44:21 localhost kernel: blkfront: xvda: barrier or flush: disabled; persistent grants: disabled; indirect descriptors: enabled;
Dec 11 09:44:21 localhost kernel: scsi host1: ata_piix
Dec 11 09:44:21 localhost kernel: ata1: PATA max MWDMA2 cmd 0x1f0 ctl 0x3f6 bmdma 0xc100 irq 14
Dec 11 09:44:21 localhost kernel: ata2: PATA max MWDMA2 cmd 0x170 ctl 0x376 bmdma 0xc108 irq 15
Dec 11 09:44:21 localhost kernel:  xvda: xvda1 xvda2 xvda3 xvda4 xvda6 xvda7 xvda9
Dec 11 09:44:21 localhost systemd-udevd[300]: link_config: autonegotiation is unset or enabled, the speed and duplex are not writable.
Dec 11 09:44:21 localhost systemd[1]: Found device /dev/disk/by-label/ROOT.
Dec 11 09:44:21 localhost systemd[1]: Reached target Initrd Root Device.
Dec 11 09:44:21 localhost systemd[1]: Found device /dev/disk/by-partuuid/7130c94a-213a-4e5a-8e26-6cce9662f132.
Dec 11 09:44:21 localhost systemd[1]: Starting Verity Setup for /dev/mapper/usr...
Dec 11 09:44:21 localhost systemd[1]: Started Verity Setup for /dev/mapper/usr.
Dec 11 09:44:21 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=verity-setup comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:21 localhost systemd[1]: Found device /dev/mapper/usr.
Dec 11 09:44:21 localhost systemd[1]: Started dracut initqueue hook.
Dec 11 09:44:21 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-initqueue comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:21 localhost systemd[1]: Reached target Remote File Systems (Pre).
Dec 11 09:44:21 localhost systemd[1]: Reached target Remote File Systems.
Dec 11 09:44:21 localhost systemd[1]: Starting dracut pre-mount hook...
Dec 11 09:44:21 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-pre-mount comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:21 localhost systemd[1]: Started dracut pre-mount hook.
Dec 11 09:44:21 localhost systemd[1]: Starting File System Check on /dev/disk/by-label/ROOT...
Dec 11 09:44:21 localhost systemd-fsck[373]: ROOT: clean, 690/1498496 files, 70270/1489915 blocks
Dec 11 09:44:21 localhost systemd[1]: Started File System Check on /dev/disk/by-label/ROOT.
Dec 11 09:44:21 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-fsck-root comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:21 localhost systemd[1]: Mounting /sysroot...
Dec 11 09:44:21 localhost kernel: EXT4-fs (xvda9): mounted filesystem with ordered data mode. Opts: (null)
Dec 11 09:44:21 localhost systemd[1]: Mounted /sysroot.
Dec 11 09:44:21 localhost systemd[1]: Mounting /sysroot/usr...
Dec 11 09:44:21 localhost systemd[1]: Reached target Initrd Root File System.
Dec 11 09:44:21 localhost systemd[1]: Mounted /sysroot/usr.
Dec 11 09:44:21 localhost kernel: EXT4-fs (dm-0): mounted filesystem without journal. Opts: (null)
Dec 11 09:44:21 localhost systemd[1]: Starting Root filesystem setup...
Dec 11 09:44:21 localhost systemd[1]: Started Root filesystem setup.
Dec 11 09:44:21 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=initrd-setup-root comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:21 localhost audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=initrd-setup-root comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:21 localhost systemd[1]: Starting Reload Configuration from the Real Root...
Dec 11 09:44:21 localhost systemd[1]: Reloading.
Dec 11 09:44:21 localhost systemd[1]: Started Reload Configuration from the Real Root.
Dec 11 09:44:21 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=initrd-parse-etc comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:21 localhost audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=initrd-parse-etc comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:21 localhost systemd[1]: Reached target Initrd File Systems.
Dec 11 09:44:21 localhost systemd[1]: Reached target Initrd Default Target.
Dec 11 09:44:21 localhost systemd[1]: Starting dracut pre-pivot and cleanup hook...
Dec 11 09:44:21 localhost systemd[1]: Started dracut pre-pivot and cleanup hook.
Dec 11 09:44:21 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-pre-pivot comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:21 localhost systemd[1]: Starting Cleaning Up and Shutting Down Daemons...
Dec 11 09:44:21 localhost systemd[1]: Started Cleaning Up and Shutting Down Daemons.
Dec 11 09:44:21 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=initrd-cleanup comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:21 localhost audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=initrd-cleanup comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:21 localhost systemd[1]: Stopped target Timers.
Dec 11 09:44:21 localhost systemd[1]: Stopped dracut pre-pivot and cleanup hook.
Dec 11 09:44:21 localhost audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-pre-pivot comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:21 localhost systemd[1]: Stopped target Remote File Systems.
Dec 11 09:44:21 localhost systemd[1]: Stopped target Initrd Default Target.
Dec 11 09:44:21 localhost systemd[1]: Stopped target Remote File Systems (Pre).
Dec 11 09:44:21 localhost systemd[1]: Stopped dracut pre-mount hook.
Dec 11 09:44:21 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-pre-mount comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:21 localhost audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-pre-mount comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:21 localhost systemd[1]: Stopped dracut initqueue hook.
Dec 11 09:44:21 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-initqueue comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:21 localhost audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-initqueue comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:21 localhost systemd[1]: Stopped target Basic System.
Dec 11 09:44:21 localhost systemd[1]: Stopped target Slices.
Dec 11 09:44:21 localhost systemd[1]: Stopped target Sockets.
Dec 11 09:44:21 localhost systemd[1]: Stopped target Paths.
Dec 11 09:44:21 localhost systemd[1]: Stopped target Initrd Root Device.
Dec 11 09:44:21 localhost systemd[1]: Stopped target System Initialization.
Dec 11 09:44:21 localhost systemd[1]: Stopped target Local File Systems.
Dec 11 09:44:22 localhost systemd[1]: Stopped target Swap.
Dec 11 09:44:22 localhost systemd[1]: Stopped udev Coldplug all Devices.
Dec 11 09:44:22 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-udev-trigger comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:22 localhost audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-udev-trigger comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:22 localhost systemd[1]: Stopped dracut pre-trigger hook.
Dec 11 09:44:22 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-pre-trigger comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:22 localhost audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-pre-trigger comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:22 localhost systemd[1]: Stopping udev Kernel Device Manager...
Dec 11 09:44:22 localhost systemd[1]: Stopped Apply Kernel Variables.
Dec 11 09:44:22 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-sysctl comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:22 localhost audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-sysctl comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:22 localhost systemd[1]: Stopped target Encrypted Volumes.
Dec 11 09:44:22 localhost systemd[1]: Stopped Dispatch Password Requests to Console Directory Watch.
Dec 11 09:44:22 localhost systemd[1]: Stopped udev Kernel Device Manager.
Dec 11 09:44:22 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-udevd comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:22 localhost audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-udevd comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:22 localhost systemd[1]: Stopped Create Static Device Nodes in /dev.
Dec 11 09:44:22 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-tmpfiles-setup-dev comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:22 localhost audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-tmpfiles-setup-dev comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:22 localhost systemd[1]: Stopped Create list of required static device nodes for the current kernel.
Dec 11 09:44:22 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=kmod-static-nodes comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:22 localhost audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=kmod-static-nodes comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:22 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-pre-udev comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:22 localhost audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-pre-udev comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:22 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-cmdline comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:22 localhost audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-cmdline comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:22 localhost systemd[1]: Stopped dracut pre-udev hook.
Dec 11 09:44:22 localhost systemd[1]: Stopped dracut cmdline hook.
Dec 11 09:44:22 localhost systemd[1]: Closed udev Kernel Socket.
Dec 11 09:44:22 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=initrd-udevadm-cleanup-db comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:22 localhost audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=initrd-udevadm-cleanup-db comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:22 localhost systemd[1]: Closed udev Control Socket.
Dec 11 09:44:22 localhost systemd[1]: Starting Cleanup udevd DB...
Dec 11 09:44:22 localhost systemd[1]: Started Cleanup udevd DB.
Dec 11 09:44:22 localhost systemd[1]: Reached target Switch Root.
Dec 11 09:44:22 localhost systemd[1]: Starting Switch Root...
Dec 11 09:44:22 localhost systemd[1]: Switching root.
Dec 11 09:44:22 localhost systemd-journald[124]: Journal stopped
Dec 11 09:44:24 localhost systemd-journald[124]: Received SIGTERM from PID 1 (n/a).
Dec 11 09:44:24 localhost kernel: systemd: 17 output lines suppressed due to ratelimiting
Dec 11 09:44:24 localhost kernel: SELinux: 4096 avtab hash slots, 13428 rules.
Dec 11 09:44:24 localhost kernel: SELinux: 4096 avtab hash slots, 13428 rules.
Dec 11 09:44:24 localhost kernel: SELinux:  6 users, 6 roles, 1327 types, 55 bools, 1 sens, 1024 cats
Dec 11 09:44:24 localhost kernel: SELinux:  92 classes, 13428 rules
Dec 11 09:44:24 localhost kernel: SELinux:  Permission validate_trans in class security not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission getrlimit in class process not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission module_load in class system not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class file not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class dir not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class lnk_file not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class chr_file not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class blk_file not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class sock_file not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class fifo_file not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class tcp_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class udp_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class rawip_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class netlink_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class packet_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class key_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class unix_stream_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class unix_dgram_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class netlink_route_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class netlink_tcpdiag_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class netlink_nflog_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class netlink_xfrm_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class netlink_selinux_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class netlink_iscsi_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class netlink_audit_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class netlink_fib_lookup_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class netlink_connector_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class netlink_netfilter_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class netlink_dnrt_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class netlink_kobject_uevent_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class netlink_generic_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class netlink_scsitransport_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class netlink_rdma_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class netlink_crypto_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class appletalk_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class dccp_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Permission map in class tun_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class cap_userns not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class cap2_userns not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class sctp_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class icmp_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class ax25_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class ipx_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class netrom_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class atmpvc_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class x25_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class rose_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class decnet_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class atmsvc_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class rds_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class irda_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class pppox_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class llc_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class can_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class tipc_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class bluetooth_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class iucv_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class rxrpc_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class isdn_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class phonet_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class ieee802154_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class caif_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class alg_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class nfc_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class vsock_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class kcm_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class qipcrtr_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class smc_socket not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class infiniband_pkey not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux:  Class infiniband_endport not defined in policy.
Dec 11 09:44:24 localhost kernel: SELinux: the above unknown classes and permissions will be allowed
Dec 11 09:44:24 localhost kernel: SELinux:  policy capability network_peer_controls=1
Dec 11 09:44:24 localhost kernel: SELinux:  policy capability open_perms=1
Dec 11 09:44:24 localhost kernel: SELinux:  policy capability extended_socket_class=0
Dec 11 09:44:24 localhost kernel: SELinux:  policy capability always_check_network=0
Dec 11 09:44:24 localhost kernel: SELinux:  policy capability cgroup_seclabel=0
Dec 11 09:44:24 localhost kernel: SELinux:  Completing initialization.
Dec 11 09:44:24 localhost kernel: SELinux:  Setting up existing superblocks.
Dec 11 09:44:24 localhost systemd[1]: Successfully loaded SELinux policy in 336.813ms.
Dec 11 09:44:24 localhost systemd[1]: Relabelled /dev and /run in 5.232ms.
Dec 11 09:44:24 localhost systemd-journald[521]: Journal started
Dec 11 09:44:24 localhost systemd-journald[521]: Runtime journal (/run/log/journal/f904112a3941436ea8efadf061211bcc) is 6.2M, max 49.7M, 43.5M free.
Dec 11 09:44:22 localhost audit: MAC_POLICY_LOAD policy loaded auid=4294967295 ses=4294967295
Dec 11 09:44:24 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=systemd-journald comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:24 localhost audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=systemd-journald comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:24 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=initrd-switch-root comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:24 localhost audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=initrd-switch-root comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:24 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=systemd-journald comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:24 localhost audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=systemd-journald comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:24 localhost audit: CONFIG_CHANGE audit_enabled=1 old=1 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 res=1
Dec 11 09:44:22 localhost /usr/lib64/systemd/system-generators/torcx-generator[517]: time="2017-12-11T09:44:22Z" level=debug msg="common configuration parsed" base_dir="/var/lib/torcx/" conf_dir="/etc/torcx/" run_dir="/run/torcx/" store_paths=[/usr/share/torcx/store/ /usr/share/oem/torcx/store/1576.4.0/ /usr/share/oem/torcx/store/ /var/lib/torcx/store/1576.4.0/ /var/lib/torcx/store/]
Dec 11 09:44:22 localhost systemd[1]: systemd 234 running in system mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK -SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT -GNUTLS -ACL +XZ +LZ4 +SECCOMP +BLKID -ELFUTILS +KMOD -IDN2 -IDN default-hierarchy=legacy)
Dec 11 09:44:22 localhost /usr/lib64/systemd/system-generators/torcx-generator[517]: time="2017-12-11T09:44:22Z" level=debug msg="profile found" name=docker-1.12-no path="/usr/share/torcx/profiles/docker-1.12-no.json"
Dec 11 09:44:22 localhost systemd[1]: Detected virtualization xen.
Dec 11 09:44:22 localhost /usr/lib64/systemd/system-generators/torcx-generator[517]: time="2017-12-11T09:44:22Z" level=debug msg="profile found" name=docker-1.12-yes path="/usr/share/torcx/profiles/docker-1.12-yes.json"
Dec 11 09:44:22 localhost systemd[1]: Detected architecture x86-64.
Dec 11 09:44:22 localhost /usr/lib64/systemd/system-generators/torcx-generator[517]: time="2017-12-11T09:44:22Z" level=debug msg="profile found" name=vendor path="/usr/share/torcx/profiles/vendor.json"
Dec 11 09:44:22 localhost /usr/lib64/systemd/system-generators/torcx-generator[517]: time="2017-12-11T09:44:22Z" level=info msg="no vendor profile selected by /etc/coreos/docker-1.12"
Dec 11 09:44:22 localhost /usr/lib64/systemd/system-generators/torcx-generator[517]: time="2017-12-11T09:44:22Z" level=debug msg="skipped missing lower profile" missing profile=oem
Dec 11 09:44:22 localhost /usr/lib64/systemd/system-generators/torcx-generator[517]: time="2017-12-11T09:44:22Z" level=warning msg="no next profile: unable to read profile file: open /etc/torcx/next-profile: no such file or directory"
Dec 11 09:44:22 localhost /usr/lib64/systemd/system-generators/torcx-generator[517]: time="2017-12-11T09:44:22Z" level=debug msg="apply configuration parsed" lower profiles (vendor/oem)=[vendor] upper profile (user)=
Dec 11 09:44:22 localhost /usr/lib64/systemd/system-generators/torcx-generator[517]: time="2017-12-11T09:44:22Z" level=debug msg="mounted tmpfs" target="/run/torcx/unpack"
Dec 11 09:44:22 localhost /usr/lib64/systemd/system-generators/torcx-generator[517]: time="2017-12-11T09:44:22Z" level=debug msg="profile found" name=docker-1.12-no path="/usr/share/torcx/profiles/docker-1.12-no.json"
Dec 11 09:44:22 localhost /usr/lib64/systemd/system-generators/torcx-generator[517]: time="2017-12-11T09:44:22Z" level=debug msg="profile found" name=docker-1.12-yes path="/usr/share/torcx/profiles/docker-1.12-yes.json"
Dec 11 09:44:22 localhost /usr/lib64/systemd/system-generators/torcx-generator[517]: time="2017-12-11T09:44:22Z" level=debug msg="profile found" name=vendor path="/usr/share/torcx/profiles/vendor.json"
Dec 11 09:44:22 localhost /usr/lib64/systemd/system-generators/torcx-generator[517]: time="2017-12-11T09:44:22Z" level=debug msg="new archive/reference added to cache" name=docker path="/usr/share/torcx/store/docker:1.12.torcx.tgz" reference=1.12
Dec 11 09:44:22 localhost /usr/lib64/systemd/system-generators/torcx-generator[517]: time="2017-12-11T09:44:22Z" level=debug msg="new archive/reference added to cache" name=docker path="/usr/share/torcx/store/docker:17.09.torcx.tgz" reference=17.09
Dec 11 09:44:22 localhost /usr/lib64/systemd/system-generators/torcx-generator[517]: time="2017-12-11T09:44:22Z" level=debug msg="new archive/reference added to cache" name=docker path="/usr/share/torcx/store/docker:com.coreos.cl.torcx.tgz" reference=com.coreos.cl
Dec 11 09:44:22 localhost /usr/lib64/systemd/system-generators/torcx-generator[517]: time="2017-12-11T09:44:22Z" level=info msg="store skipped" err="open /usr/share/oem/torcx/store/1576.4.0/: no such file or directory" path="/usr/share/oem/torcx/store/1576.4.0/"
Dec 11 09:44:22 localhost /usr/lib64/systemd/system-generators/torcx-generator[517]: time="2017-12-11T09:44:22Z" level=info msg="store skipped" err="open /usr/share/oem/torcx/store/: no such file or directory" path="/usr/share/oem/torcx/store/"
Dec 11 09:44:22 localhost /usr/lib64/systemd/system-generators/torcx-generator[517]: time="2017-12-11T09:44:22Z" level=info msg="store skipped" err="open /var/lib/torcx/store/1576.4.0/: no such file or directory" path="/var/lib/torcx/store/1576.4.0/"
Dec 11 09:44:22 localhost /usr/lib64/systemd/system-generators/torcx-generator[517]: time="2017-12-11T09:44:22Z" level=info msg="store skipped" err="open /var/lib/torcx/store/: no such file or directory" path="/var/lib/torcx/store/"
Dec 11 09:44:23 localhost /usr/lib64/systemd/system-generators/torcx-generator[517]: time="2017-12-11T09:44:23Z" level=debug msg="image unpacked" image=docker path="/run/torcx/unpack/docker" reference=com.coreos.cl
Dec 11 09:44:23 localhost /usr/lib64/systemd/system-generators/torcx-generator[517]: time="2017-12-11T09:44:23Z" level=debug msg="binaries propagated" assets=[/bin/containerd /bin/containerd-shim /bin/ctr /bin/docker /bin/docker-containerd /bin/docker-containerd-shim /bin/docker-init /bin/docker-proxy /bin/docker-runc /bin/dockerd /bin/runc /bin/tini] image=docker path="/run/torcx/unpack/docker" reference=com.coreos.cl
Dec 11 09:44:23 localhost /usr/lib64/systemd/system-generators/torcx-generator[517]: time="2017-12-11T09:44:23Z" level=debug msg="networkd units propagated" assets=[/lib/systemd/network/50-docker.network /lib/systemd/network/90-docker-veth.network] image=docker path="/run/torcx/unpack/docker" reference=com.coreos.cl
Dec 11 09:44:23 localhost /usr/lib64/systemd/system-generators/torcx-generator[517]: time="2017-12-11T09:44:23Z" level=debug msg="systemd units propagated" assets=[/lib/systemd/system/containerd.service /lib/systemd/system/docker.service /lib/systemd/system/docker.socket /lib/systemd/system/sockets.target.wants] image=docker path="/run/torcx/unpack/docker" reference=com.coreos.cl
Dec 11 09:44:23 localhost /usr/lib64/systemd/system-generators/torcx-generator[517]: time="2017-12-11T09:44:23Z" level=debug msg="profile applied" sealed profile="/run/torcx/profile.json" upper profile=
Dec 11 09:44:23 localhost /usr/lib64/systemd/system-generators/torcx-generator[517]: time="2017-12-11T09:44:23Z" level=debug msg="system state sealed" content=[TORCX_LOWER_PROFILES="vendor" TORCX_UPPER_PROFILE="" TORCX_PROFILE_PATH="/run/torcx/profile.json" TORCX_BINDIR="/run/torcx/bin" TORCX_UNPACKDIR="/run/torcx/unpack"] path="/run/metadata/torcx"
Dec 11 09:44:24 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=verity-setup comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:24 localhost audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=verity-setup comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:24 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=systemd-fsck-root comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:24 localhost audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=systemd-fsck-root comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:24 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=systemd-journald comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:24 localhost systemd[1]: Started Create list of required static device nodes for the current kernel.
Dec 11 09:44:24 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=kmod-static-nodes comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:24 localhost systemd[1]: Started Apply Kernel Variables.
Dec 11 09:44:24 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=systemd-sysctl comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:24 localhost systemd[1]: Started Load/Save Random Seed.
Dec 11 09:44:24 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=systemd-random-seed comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:24 localhost systemd[1]: Started Create missing system files.
Dec 11 09:44:24 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=coreos-tmpfiles comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:24 localhost audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=coreos-tmpfiles comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:24 localhost systemd[1]: Starting Create System Users...
Dec 11 09:44:24 localhost systemd[1]: Starting Flush Journal to Persistent Storage...
Dec 11 09:44:24 localhost systemd[1]: Starting Set fake PV driver version for XenServer...
Dec 11 09:44:24 localhost systemd[1]: Started Create System Users.
Dec 11 09:44:24 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=systemd-sysusers comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:24 localhost systemd[1]: Starting Create Static Device Nodes in /dev...
Dec 11 09:44:24 localhost systemd[1]: Started Set fake PV driver version for XenServer.
Dec 11 09:44:24 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=xenserver-pv-version comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:24 localhost systemd-journald[521]: Time spent on flushing to /var is 57.439ms for 662 entries.
Dec 11 09:44:24 localhost systemd-journald[521]: System journal (/var/log/journal/f904112a3941436ea8efadf061211bcc) is 8.0M, max 557.2M, 549.2M free.
Dec 11 09:44:24 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=systemd-tmpfiles-setup-dev comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:24 localhost systemd[1]: Started Create Static Device Nodes in /dev.
Dec 11 09:44:24 localhost systemd[1]: Starting udev Kernel Device Manager...
Dec 11 09:44:24 localhost systemd-udevd[553]: Network interface NamePolicy= disabled on kernel command line, ignoring.
Dec 11 09:44:24 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=systemd-journal-flush comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:24 localhost systemd[1]: Started Flush Journal to Persistent Storage.
Dec 11 09:44:24 localhost systemd-udevd[553]: Invalid rule /usr/lib64/udev/rules.d/73-seat-late.rules:15: RUN{builtin}: 'uaccess' unknown
Dec 11 09:44:24 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=systemd-udevd comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:24 localhost systemd[1]: Started udev Kernel Device Manager.
Dec 11 09:44:24 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=systemd-hwdb-update comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:24 localhost systemd[1]: Started Rebuild Hardware Database.
Dec 11 09:44:24 localhost systemd[1]: Starting udev Coldplug all Devices...
Dec 11 09:44:24 localhost kernel: input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input2
Dec 11 09:44:24 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=systemd-udev-trigger comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:24 localhost systemd[1]: Started udev Coldplug all Devices.
Dec 11 09:44:24 localhost systemd[1]: Starting udev Wait for Complete Device Initialization...
Dec 11 09:44:24 localhost kernel: ACPI: Power Button [PWRF]
Dec 11 09:44:24 localhost kernel: input: Sleep Button as /devices/LNXSYSTM:00/LNXSLPBN:00/input/input3
Dec 11 09:44:24 localhost kernel: ACPI: Sleep Button [SLPF]
Dec 11 09:44:24 localhost kernel: piix4_smbus 0000:00:01.3: SMBus base address uninitialized - upgrade BIOS or use force_addr=0xaddr
Dec 11 09:44:24 localhost kernel: input: ImExPS/2 Generic Explorer Mouse as /devices/platform/i8042/serio1/input/input4
Dec 11 09:44:24 localhost systemd[1]: Found device /dev/ttyS0.
Dec 11 09:44:24 localhost kernel: EDAC MC: Ver: 3.0.0
Dec 11 09:44:25 localhost systemd-udevd[586]: link_config: autonegotiation is unset or enabled, the speed and duplex are not writable.
Dec 11 09:44:25 localhost kernel: EDAC sbridge: Seeking for: PCI ID 8086:2fa0
Dec 11 09:44:25 localhost kernel: EDAC sbridge:  Ver: 1.1.2
Dec 11 09:44:25 localhost systemd-udevd[587]: link_config: autonegotiation is unset or enabled, the speed and duplex are not writable.
Dec 11 09:44:25 localhost kernel: mousedev: PS/2 mouse device common for all mice
Dec 11 09:44:28 localhost systemd-udevd[553]: Network interface NamePolicy= disabled on kernel command line, ignoring.
Dec 11 09:44:28 localhost systemd-udevd[553]: Invalid rule /usr/lib64/udev/rules.d/73-seat-late.rules:15: RUN{builtin}: 'uaccess' unknown
Dec 11 09:44:28 localhost systemd[1]: Found device /dev/disk/by-label/OEM.
Dec 11 09:44:28 localhost systemd[1]: Mounting /usr/share/oem...
Dec 11 09:44:28 localhost systemd[1]: Mounting Boot partition...
Dec 11 09:44:28 localhost systemd[1]: Started udev Wait for Complete Device Initialization.
Dec 11 09:44:28 localhost kernel: EXT4-fs (xvda6): mounted filesystem with ordered data mode. Opts: commit=600
Dec 11 09:44:28 localhost kernel: kauditd_printk_skb: 59 callbacks suppressed
Dec 11 09:44:28 localhost kernel: audit: type=1130 audit(1512985468.292:70): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=systemd-udev-settle comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:28 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=systemd-udev-settle comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:28 localhost systemd[1]: Starting Activation of LVM2 logical volumes...
Dec 11 09:44:28 localhost kernel: random: crng init done
Dec 11 09:44:28 localhost systemd[1]: Mounted /usr/share/oem.
Dec 11 09:44:28 localhost lvm[609]:   lvmetad is not active yet, using direct activation during sysinit
Dec 11 09:44:28 localhost systemd[1]: Started Activation of LVM2 logical volumes.
Dec 11 09:44:28 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=lvm2-activation-early comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:28 localhost kernel: audit: type=1130 audit(1512985468.358:71): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=lvm2-activation-early comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:28 localhost systemd[1]: Reached target Encrypted Volumes.
Dec 11 09:44:28 localhost systemd[1]: Starting Activation of LVM2 logical volumes...
Dec 11 09:44:28 localhost lvm[621]:   lvmetad is not active yet, using direct activation during sysinit
Dec 11 09:44:28 localhost systemd[1]: Mounted Boot partition.
Dec 11 09:44:28 localhost audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=lvm2-activation-early comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:28 localhost kernel: audit: type=1131 audit(1512985468.368:72): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=lvm2-activation-early comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:28 localhost systemd[1]: Started Activation of LVM2 logical volumes.
Dec 11 09:44:28 localhost systemd[1]: Reached target Local File Systems (Pre).
Dec 11 09:44:28 localhost systemd[1]: Reached target Local File Systems.
Dec 11 09:44:28 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=lvm2-activation comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:28 localhost kernel: audit: type=1130 audit(1512985468.410:73): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=lvm2-activation comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:28 localhost systemd[1]: Starting Rebuild Journal Catalog...
Dec 11 09:44:28 localhost systemd[1]: Starting Create Volatile Files and Directories...
Dec 11 09:44:28 localhost systemd[1]: Starting Rebuild Dynamic Linker Cache...
Dec 11 09:44:28 localhost audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=lvm2-activation comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:28 localhost kernel: audit: type=1131 audit(1512985468.410:74): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=lvm2-activation comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:28 localhost systemd[1]: Started Rebuild Journal Catalog.
Dec 11 09:44:28 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=systemd-journal-catalog-update comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:28 localhost kernel: audit: type=1130 audit(1512985468.470:75): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=systemd-journal-catalog-update comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:28 localhost kernel: audit: type=1130 audit(1512985468.526:76): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=ldconfig comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:28 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=ldconfig comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:28 localhost systemd[1]: Started Rebuild Dynamic Linker Cache.
Dec 11 09:44:28 localhost systemd[1]: Starting Update is Completed...
Dec 11 09:44:28 localhost systemd[1]: Started Update is Completed.
Dec 11 09:44:28 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=systemd-update-done comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:28 localhost kernel: audit: type=1130 audit(1512985468.550:77): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=systemd-update-done comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:28 localhost kernel: audit: type=1130 audit(1512985468.619:78): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=systemd-tmpfiles-setup comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:28 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=systemd-tmpfiles-setup comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:28 localhost systemd[1]: Started Create Volatile Files and Directories.
Dec 11 09:44:28 localhost systemd[1]: Starting Load Security Auditing Rules...
Dec 11 09:44:28 localhost systemd[1]: Starting Clean up broken links in /etc/ssl/certs...
Dec 11 09:44:28 localhost systemd[1]: Starting Update UTMP about System Boot/Shutdown...
Dec 11 09:44:28 localhost systemd[1]: Starting Network Time Synchronization...
Dec 11 09:44:28 localhost audit[640]: SYSTEM_BOOT pid=640 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg=' comm="systemd-update-utmp" exe="/usr/lib64/systemd/systemd-update-utmp" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:28 localhost kernel: audit: type=1127 audit(1512985468.668:79): pid=640 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg=' comm="systemd-update-utmp" exe="/usr/lib64/systemd/systemd-update-utmp" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:28 localhost systemd[1]: Started Clean up broken links in /etc/ssl/certs.
Dec 11 09:44:28 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=clean-ca-certificates comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:28 localhost audit[1]: SERVICE_STOP pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=clean-ca-certificates comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:28 localhost systemd[1]: Started Update UTMP about System Boot/Shutdown.
Dec 11 09:44:28 localhost audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 msg='unit=systemd-update-utmp comm="systemd" exe="/usr/lib64/systemd/systemd" hostname=? addr=? terminal=? res=success'
Dec 11 09:44:28 localhost augenrules[632]: /sbin/augenrules: No change
Dec 11 09:44:28 localhost audit: CONFIG_CHANGE audit_backlog_limit=320 old=64 auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 res=1
Dec 11 09:44:28 localhost augenrules[632]: No rules
Dec 11 09:44:28 localhost augenrules[632]: enabled 1
Dec 11 09:44:28 localhost augenrules[632]: failure 1
Dec 11 09:44:28 localhost augenrules[632]: pid 0
Dec 11 09:44:28 localhost augenrules[632]: rate_limit 0
Dec 11 09:44:28 localhost augenrules[632]: backlog_limit 320
Dec 11 09:44:28 localhost augenrules[632]: lost 0
Dec 11 09:44:28 localhost augenrules[632]: backlog 1
Dec 11 09:44:28 localhost augenrules[632]: backlog_wait_time 60000
Dec 11 09:44:28 localhost audit: CONFIG_CHANGE auid=4294967295 ses=4294967295 subj=system_u:system_r:kernel_t:s0 op=add_rule key=(null) list=5 res=1
Dec 11 09:44:28 localhost systemd[1]: Started Load Security Auditing Rules.
Dec 11 09:44:28 localhost systemd[1]: Started Network Time Synchronization.
Dec 11 09:44:28 localhost systemd[1]: Reached target System Time Synchronized.
Dec 11 09:44:28 localhost systemd[1]: Reached target System Initialization.
Dec 11 09:44:28 localhost systemd[1]: Started Periodic Garbage Collection for rkt.
Dec 11 09:44:28 localhost systemd[1]: Started Daily Log Rotation.
Dec 11 09:44:28 localhost systemd[1]: Started Watch for update engine configuration changes.
Dec 11 09:44:28 localhost systemd[1]: Started Daily Cleanup of Temporary Directories.
Dec 11 09:44:28 localhost systemd[1]: Reached target Timers.
Dec 11 09:44:28 localhost systemd[1]: Started Watch for a cloud-config at /var/lib/coreos-install/user_data.
Dec 11 09:44:28 localhost systemd[1]: Reached target Paths.
Dec 11 09:44:28 localhost systemd[1]: Starting Docker Socket for the API.
Dec 11 09:44:28 localhost systemd[1]: Listening on OpenSSH Server Socket.
Dec 11 09:44:28 localhost systemd[1]: Listening on D-Bus System Message Bus Socket.
Dec 11 09:44:28 localhost systemd[1]: Starting Network Service...
Dec 11 09:44:28 localhost systemd[1]: Starting rkt metadata service socket.
Dec 11 09:44:28 localhost systemd[1]: Listening on Docker Socket for the API.
Dec 11 09:44:28 localhost systemd[1]: Listening on rkt metadata service socket.
Dec 11 09:44:28 localhost systemd[1]: Reached target Sockets.
Dec 11 09:44:28 localhost systemd[1]: Reached target Basic System.
Dec 11 09:44:28 localhost systemd[1]: Starting Install an ssh key from /proc/cmdline...
Dec 11 09:44:28 localhost systemd[1]: Starting example.service...
Dec 11 09:44:28 localhost systemd[1]: Starting Extend Filesystems...
Dec 11 09:44:28 localhost systemd[1]: Starting CoreOS Metadata Agent (SSH Keys)...
Dec 11 09:44:28 localhost echo[661]: Hello World
Dec 11 09:44:28 localhost systemd[1]: Starting Generate /run/coreos/motd...
Dec 11 09:44:28 localhost systemd[1]: Starting Garbage Collection for rkt...
Dec 11 09:44:28 localhost systemd[1]: Started D-Bus System Message Bus.
Dec 11 09:44:28 localhost systemd[1]: Reached target Load system-provided cloud configs.
Dec 11 09:44:28 localhost systemd[1]: Reached target Load user-provided cloud configs.
Dec 11 09:44:28 localhost systemd[1]: Reached target Containers.
Dec 11 09:44:28 localhost systemd[1]: Starting Update Engine...
Dec 11 09:44:28 localhost systemd[1]: Starting Generate sshd host keys...
Dec 11 09:44:28 localhost systemd[1]: Starting Login Service...
Dec 11 09:44:29 localhost systemd[1]: Started Install an ssh key from /proc/cmdline.
Dec 11 09:44:29 localhost systemd-networkd[658]: Enumeration completed
Dec 11 09:44:29 localhost systemd[1]: Started example.service.
Dec 11 09:44:29 localhost systemd-networkd[658]: eth0: IPv6 successfully enabled
Dec 11 09:44:29 localhost systemd[1]: Started Extend Filesystems.
Dec 11 09:44:29 localhost systemd-networkd[658]: lo: Configured
Dec 11 09:44:29 localhost systemd-networkd[658]: eth0: Gained carrier
Dec 11 09:44:29 localhost systemd[1]: Started Generate /run/coreos/motd.
Dec 11 09:44:29 localhost systemd-networkd[658]: eth0: DHCPv4 address 172.31.31.16/20 via 172.31.16.1
Dec 11 09:44:29 localhost dbus[674]: [system] Activating via systemd: service name='org.freedesktop.hostname1' unit='dbus-org.freedesktop.hostname1.service'
Dec 11 09:44:29 localhost systemd[1]: Started Network Service.
Dec 11 09:44:29 localhost systemd-timesyncd[644]: Network configuration changed, trying to establish connection.
Dec 11 09:44:29 localhost systemd[1]: Starting Hostname Service...
Dec 11 09:44:29 localhost systemd[1]: Reached target Network.
Dec 11 09:44:29 localhost systemd[1]: Starting Network Name Resolution...
Dec 11 09:44:29 localhost systemd[1]: Started Login Service.
Dec 11 09:44:29 localhost systemd-logind[686]: Watching system buttons on /dev/input/event1 (Power Button)
Dec 11 09:44:29 localhost systemd-logind[686]: Watching system buttons on /dev/input/event2 (Sleep Button)
Dec 11 09:44:29 localhost systemd-logind[686]: Watching system buttons on /dev/input/event0 (AT Translated Set 2 keyboard)
Dec 11 09:44:29 localhost systemd-logind[686]: New seat seat0.
Dec 11 09:44:29 localhost dbus[674]: [system] Successfully activated service 'org.freedesktop.hostname1'
Dec 11 09:44:29 localhost systemd[1]: Started Hostname Service.
Dec 11 09:44:29 localhost dbus[674]: [system] Activating via systemd: service name='org.freedesktop.PolicyKit1' unit='polkit.service'
Dec 11 09:44:29 localhost systemd[1]: Starting Authorization Manager...
Dec 11 09:44:29 localhost systemd-resolved[699]: Positive Trust Anchors:
Dec 11 09:44:29 localhost systemd-resolved[699]: . IN DS 19036 8 2 49aac11d7b6f6446702e54a1607371607a1a41855200fd2ce1cdde32f24e8fb5
Dec 11 09:44:29 localhost systemd-resolved[699]: . IN DS 20326 8 2 e06d44b80b8f1d39a95c0b0d7c65d08458e880409bbc683457104237c7f8ec8d
Dec 11 09:44:29 localhost systemd-resolved[699]: Negative trust anchors: 10.in-addr.arpa 16.172.in-addr.arpa 17.172.in-addr.arpa 18.172.in-addr.arpa 19.172.in-addr.arpa 20.172.in-addr.arpa 21.172.in-addr.arpa 22.172.in-addr.arpa 23.172.in-addr.arpa 24.172.in-addr.arpa 25.172.in-addr.arpa 26.172.in-addr.arpa 27.172.in-addr.arpa 28.172.in-addr.arpa 29.172.in-addr.arpa 30.172.in-addr.arpa 31.172.in-addr.arpa 168.192.in-addr.arpa d.f.ip6.arpa corp home internal intranet lan local private test
Dec 11 09:44:29 localhost systemd[1]: Started Generate sshd host keys.
Dec 11 09:44:29 localhost systemd[1]: Starting Generate /run/issue...
Dec 11 09:44:29 localhost systemd[1]: Started Generate /run/issue.
Dec 11 09:44:29 localhost systemd[1]: Starting Permit User Sessions...
Dec 11 09:44:29 localhost systemd-resolved[699]: Defaulting to hostname 'linux'.
Dec 11 09:44:29 localhost systemd[1]: Started Permit User Sessions.
Dec 11 09:44:29 localhost systemd[1]: Started Getty on tty1.
Dec 11 09:44:29 localhost systemd[1]: Started Serial Getty on ttyS0.
Dec 11 09:44:29 localhost systemd[1]: Reached target Login Prompts.
Dec 11 09:44:29 localhost systemd[1]: Started Network Name Resolution.
Dec 11 09:44:29 localhost systemd[1]: Reached target Host and Network Name Lookups.
Dec 11 09:44:29 localhost systemd[1]: Started Garbage Collection for rkt.
Dec 11 09:44:29 localhost update_engine[684]: I1211 09:44:29.340261   684 main.cc:89] CoreOS Update Engine starting
Dec 11 09:44:29 localhost systemd[1]: Started Update Engine.
Dec 11 09:44:29 localhost update_engine[684]: I1211 09:44:29.347394   684 update_check_scheduler.cc:74] Next update check in 7m8s
Dec 11 09:44:29 localhost systemd[1]: Started Cluster reboot manager.
Dec 11 09:44:29 localhost polkitd[709]: Started polkitd version 0.113
Dec 11 09:44:29 localhost polkitd[709]: Loading rules from directory /etc/polkit-1/rules.d
Dec 11 09:44:29 localhost polkitd[709]: Loading rules from directory /usr/share/polkit-1/rules.d
Dec 11 09:44:29 localhost polkitd[709]: Finished loading, compiling and executing 3 rules
Dec 11 09:44:29 localhost dbus[674]: [system] Successfully activated service 'org.freedesktop.PolicyKit1'
Dec 11 09:44:29 localhost systemd[1]: Started Authorization Manager.
Dec 11 09:44:29 localhost polkitd[709]: Acquired the name org.freedesktop.PolicyKit1 on the system bus
Dec 11 09:44:29 ip-172-31-31-16 systemd-hostnamed[696]: Changed host name to 'ip-172-31-31-16'
Dec 11 09:44:29 ip-172-31-31-16 systemd-resolved[699]: System hostname changed to 'ip-172-31-31-16'.
Dec 11 09:44:29 ip-172-31-31-16 locksmithd[720]: No configured reboot window
Dec 11 09:44:29 ip-172-31-31-16 locksmithd[720]: locksmithd starting currentOperation="UPDATE_STATUS_IDLE" strategy="reboot"
Dec 11 09:44:30 ip-172-31-31-16 systemd[1]: Started CoreOS Metadata Agent (SSH Keys).
Dec 11 09:44:30 ip-172-31-31-16 systemd[1]: Reached target Multi-User System.
Dec 11 09:44:30 ip-172-31-31-16 systemd[1]: Startup finished in 1.300s (kernel) + 1.721s (initrd) + 7.847s (userspace) = 10.868s.
Dec 11 09:44:30 ip-172-31-31-16 systemd-networkd[658]: eth0: Gained IPv6LL
Dec 11 09:44:31 ip-172-31-31-16 systemd-udevd[553]: Network interface NamePolicy= disabled on kernel command line, ignoring.
Dec 11 09:44:31 ip-172-31-31-16 systemd-udevd[553]: Invalid rule /usr/lib64/udev/rules.d/73-seat-late.rules:15: RUN{builtin}: 'uaccess' unknown
Dec 11 09:44:34 ip-172-31-31-16 systemd[1]: Created slice system-sshd.slice.
Dec 11 09:44:34 ip-172-31-31-16 systemd[1]: Started OpenSSH per-connection server daemon (172.31.9.7:60120).
Dec 11 09:44:34 ip-172-31-31-16 sshd[740]: Accepted publickey for core from 172.31.9.7 port 60120 ssh2: RSA SHA256:Jlcg2k7fd3q5FHY2nYur41maoBqK+YKYABHMp1q+Ves
Dec 11 09:44:34 ip-172-31-31-16 sshd[740]: pam_unix(sshd:session): session opened for user core by (uid=0)
Dec 11 09:44:34 ip-172-31-31-16 systemd[1]: Created slice User Slice of core.
Dec 11 09:44:34 ip-172-31-31-16 systemd[1]: Starting User Manager for UID 500...
Dec 11 09:44:34 ip-172-31-31-16 systemd[742]: pam_unix(systemd-user:session): session opened for user core by (uid=0)
Dec 11 09:44:34 ip-172-31-31-16 systemd[1]: Started Session 1 of user core.
Dec 11 09:44:34 ip-172-31-31-16 systemd-logind[686]: New session 1 of user core.
Dec 11 09:44:34 ip-172-31-31-16 systemd[742]: Reached target Paths.
Dec 11 09:44:34 ip-172-31-31-16 systemd[742]: Reached target Timers.
Dec 11 09:44:34 ip-172-31-31-16 systemd[742]: Reached target Sockets.
Dec 11 09:44:34 ip-172-31-31-16 systemd[742]: Reached target Basic System.
Dec 11 09:44:34 ip-172-31-31-16 systemd[742]: Reached target Default.
Dec 11 09:44:34 ip-172-31-31-16 systemd[742]: Startup finished in 19ms.
Dec 11 09:44:34 ip-172-31-31-16 systemd[1]: Started User Manager for UID 500.
```
