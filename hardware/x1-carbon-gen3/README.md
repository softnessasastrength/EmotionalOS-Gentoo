# ThinkPad X1 Carbon Gen 3 Reference Target

## Purpose

This directory defines the first physical hardware target for EmotionalOS Gentoo.

The goal is not to claim universal ThinkPad support. The goal is to make one machine work completely, document the result, and use that evidence to guide later profiles.

## Provisional platform assumptions

These assumptions are intentionally conservative and must be checked against the actual laptop:

- Lenovo ThinkPad X1 Carbon, third generation
- Intel Broadwell U-series CPU
- Intel integrated graphics
- UEFI boot
- Internal solid-state drive
- Intel wireless and Bluetooth hardware
- Integrated audio, webcam, keyboard, TrackPoint, and touchpad

Do not convert assumptions into hard-coded kernel or package choices until the inventory files below have been collected.

## Required inventory

Capture these from a trusted Linux live environment and commit sanitized outputs under `inventory/`:

```bash
sudo lspci -nnk
sudo lsusb
sudo dmidecode -t system -t baseboard -t bios
lsblk -o NAME,MODEL,SIZE,TYPE,FSTYPE,TRAN
inxi -Faz
ip link
rfkill list
cat /proc/cpuinfo
cat /sys/class/dmi/id/product_name
cat /sys/class/dmi/id/product_version
```

Remove serial numbers, MAC addresses, UUIDs, hostnames, and other identifiers before committing.

## Definition of hardware success

The first hardware milestone is complete only when the reference laptop can demonstrate:

- UEFI boot without manual rescue steps
- Internal display at native resolution
- Hardware-accelerated Intel graphics
- Keyboard, TrackPoint, touchpad, and external mouse input
- Wi-Fi and Bluetooth
- Speakers, headphone output, and microphone input
- Webcam
- Battery status and sensible power management
- Suspend and resume across repeated cycles
- Lid-close behavior
- Screen-brightness and audio hotkeys
- USB ports and external display output
- Stable package updates from the project configuration
- A documented recovery path

## Kernel and firmware direction

Initial implementation should favor reliability and observability over extreme minimalism.

- Start with a Gentoo distribution kernel or a broadly configured kernel.
- Confirm boot and hardware behavior before pursuing a custom minimal kernel.
- Include Intel microcode.
- Include the firmware packages required by the verified wireless and graphics hardware.
- Keep an older known-good kernel available during development.

## CPU optimization policy

The reference system is expected to be Broadwell-class, but CPU flags must be generated and reviewed on the physical machine.

For early bootstrap work, prefer conservative x86-64 settings over aggressive machine-specific optimization. A later binary-package profile may target the verified Broadwell baseline after testing.

## Real-hardware test record

Each hardware test should record:

- image or commit tested
- firmware version
- kernel version
- pass/fail result
- logs or error summary
- workaround, if any
- whether the workaround is acceptable for release
