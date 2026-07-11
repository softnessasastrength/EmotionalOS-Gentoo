# EmotionalOS Gentoo

EmotionalOS Gentoo is an experimental, owner-directed Gentoo Linux remix focused on intentional defaults, reproducible configuration, and transparent reasoning.

## Initial hardware target

The first reference machine is the **Lenovo ThinkPad X1 Carbon Gen 3**.

This target gives the project a concrete definition of success: produce a system image and installation path that can boot, install, and operate reliably on one known laptop before broadening hardware support.

The reference profile assumes the common Gen 3 platform family:

- x86-64 Intel Broadwell-class processor
- Intel integrated graphics
- UEFI firmware
- NVMe or SATA solid-state storage, depending on configuration
- Intel wireless hardware, subject to verification on the actual machine
- Built-in keyboard, TrackPoint, touchpad, audio, webcam, Bluetooth, suspend, and battery reporting

Exact component IDs must be captured from the target laptop before kernel and firmware choices are treated as final.

## Project principles

- Document why a choice was made, not only what was chosen.
- Prefer reproducible configuration over hand-edited mystery state.
- Validate on real hardware in addition to virtual-machine boot tests.
- Keep hardware-specific policy separate from general EmotionalOS policy.
- Build binary packages and caches so CI does not rebuild the world unnecessarily.
- Treat the repository as source; generated ISOs and package artifacts are outputs.

## Current phase

**Bootstrap and hardware definition.**

This repository does not yet produce a finished distribution. The initial work establishes the reference hardware contract, Portage configuration, validation plan, and staged roadmap required to reach a bootable image.

## Repository layout

```text
config/portage/          Portage defaults and package policy
hardware/x1-carbon-gen3/ Reference hardware notes and validation checklist
docs/                    Architecture, build, and release documentation
scripts/                 Future build and inspection tooling
.github/workflows/       Future CI validation and image-building workflows
```

## Planned build path

1. Capture the real laptop hardware inventory.
2. Select Gentoo profile, init system, desktop stack, and filesystem policy.
3. Build a reproducible stage environment.
4. Produce and reuse binary packages.
5. Generate a bootable live or installer image.
6. Boot-test the image in QEMU.
7. Install and validate it on the X1 Carbon Gen 3.
8. Record failures, fixes, and hardware-specific exceptions.

## Status and limitations

This is an experimental operating-system project. Early files are design inputs and bootstrap configuration, not a supported release. Do not assume that a generated image is safe for production use or that unverified hardware settings are correct.
